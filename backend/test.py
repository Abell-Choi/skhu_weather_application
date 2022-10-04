from inspect import getclasstree
from threading import local
from typing import List
import requests
from bs4 import BeautifulSoup as bs
import xmltodict
import json

# connect func
# 학교 공지사항의 정보를 받기 위하여 하는 작업입니다. 실패할 경우 None을 반환합니다.
def getRequestData():
    headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'User-Agent':'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
        'Host': "lms.skhu.ac.kr"
        ,'Origin': "https://lms.skhu.ac.kr"
        ,'Referer': "https://lms.skhu.ac.kr/ilos/community/notice_list_form.acl"
    }

    data = {
    "SCH_KEY": "T",
    "SCH_TARGET":"",
    "SCH_VALUE" : "",
    "start": "1",
    "encoding": "utf-8" 
    }

    try:
        req = requests.post('https://lms.skhu.ac.kr/ilos/community/notice_list.acl', data=data, headers=headers)
    except Exception as e:
        print("requests error -> {0}".format(e))
        return None

    bs_dom_object = bs(req.content, 'html.parser')
    return bs_dom_object


## raw data -> result dict
def notice_res_dict(type:int, title:str, target:str, target_url:str, writter:str, uploadDate:str, viewCount:int):
    # Notice 데이터를 dict 형태로 API 로 사용하기 위하여 재조합 합니다.
    return {
        'type' : type,
        'title' : title,
        'target' : target,
        'target_url' : target_url,
        'writter' : writter,
        'uploadDate' : uploadDate,
        'viewCount' : viewCount
    }


def sortingNoticeData(): ## Notice Data를 List 형식으로 정렬합니다.
    bs_dom_object = getRequestData()
    # 연결 에러시 리턴
    if bs_dom_object == None:
        return {
            'res' : 'err',
            'value' : "Can't connecting notice server"
        }
    tr_data_list = bs_dom_object.select('tbody > tr')
    export_tr_data_list = []


    for i in tr_data_list:

        if i.find('th') != None:
            #print('th')
            continue
        temp_num_type = -1
        if i.select('td')[0].text != '':
            temp_num_type = int(i.select('td')[0].text)
        temp_object = notice_res_dict(
            temp_num_type,
            i.select('td')[2].select('.site-link')[0].text,
            i.select('td')[1].text,
            'https://lms.skhu.ac.kr/'.format(i.select('td')[2].select('.site-link')[0].attrs['href']),
            i.select('td')[3].text.replace('\n','').replace('\r','').strip(),
            i.select('td')[5].text,
            i.select('td')[4].text
        )
        export_tr_data_list.append(temp_object)

    return {'res' : 'ok', 'value' : export_tr_data_list}


# string_local_code의 local_code 데이터만을 ㅣist로 받습니다.
# 만약 string_local_code 가 ''이거나 없다면 "GURO_F08" 으로 대체됩니다.
# 만약 연결이 불가능하면 null로 표시됩니다.
def getLocalData(string_local_code:str = ''):
    if string_local_code == '': string_local_code = 'GURO_F08'

    url = 'http://apis.data.go.kr/3160000/guroPointFocInfoSvc/getGuro10PointFocInfoSvc'
    params ={'serviceKey' : 'CUVA5IJchn3HKUbkeZvoDyJOnPeb1McJdicq6Ho830JRN9SpE8BpjadSGBQ/Dr6LhXgBiJLRVG2calIzDYLRqA==', 'returnType' : 'json', 'numOfRows' : '10', 'pageNo' : '1' }

    try: response = requests.get(url, params=params)
    except Exception as e : return {'res' : 'err', 'value' : "can't connecting wether data {0}".format(e)}
    
    try: dict_convert = xmltodict.parse(response.content)
    except Exception as e: return {'res' : 'err', 'value' : "connection error -> {0}".format(e)}

    if not 'response' in dict_convert : return {'res' : 'err', 'value' : "is not reguler type"}
    dict_data_list = dict_convert['response']['body']['items']['item']
    local_data_list = []

    for i in dict_data_list:
        if i['localCode'] == string_local_code: local_data_list.append(i)

    return {'res' : 'ok', 'value' : local_data_list}


# 시간별로 데이터를 가공합니다.
def getWeatherSorting(local_data_list:list = None):
    if local_data_list == None:
        temp_dict = getLocalData()
        if temp_dict['res'] == 'err': return temp_dict
        local_data_list = temp_dict['value']
    # 현재 날짜기준 가장 가까운 것만 추출
    export_data_dict = {}
    for i in local_data_list:
        if i['baseDate'] != local_data_list[0]['baseDate']: continue
        strSplit = i['fcsDate']
        strSplit = strSplit[0:4] +'.' +strSplit[4:8] +'.' +strSplit[8:]
        export_data_dict[strSplit] = i

    return {'res' : 'ok', 'value' : export_data_dict}