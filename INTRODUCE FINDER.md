# A3.1 소스코드

## 머릿말

**프로젝트 명** - FineDust  
**시스템 명** - Finder  
**버전** - ver 0.1  
**작성자** - 김정현  
**작성일** - 2019.06.28

## 내용

### P 3.1 소스코드

-----

**1) finder.js**

```js
/*H*****************************************************************
* 프로그램 제목 : 데이터 인젝터
* 작성일과 버전번호 : 2019.06.28 ver 0.1
*
* 프로그램의 전체적인 목적 -
* 	공공데이터 포털에 있는 미세먼지 데이터를 전부 들고와 가공한 후,
* 	데이터베이스에 잘 가공하여 삽입
*
* 구조와 설계 -
* 	동기 동작에 필요한 모듈과 request, database 의 초기 설정을 마치고
* 	순서에 알맞게 request 를 보낸 다음 정리 후 데이터베이스에 삽입
*
* 공유 변수 -
* 	request, urlencode, fs, token, mysql, connection, area, list
*
* 프로그램에서 사용하는 파일 -
* 	database_token.txt : 데이터베이스 연결 정보가 파일에 기술되어있음
*
* 외부참조 모듈과 라이브러리 -
* 	sync-request, urlencode, fs, sync-mysql
*****************************************************************H*/


"use strict";
const request = require('sync-request')
const urlencode = require('urlencode')
const fs = require('fs')
const token = JSON.parse(fs.readFileSync("database_token.txt"))
const mysql = require('sync-mysql');
const connection = new mysql({
  host: token.ip,
  user: token.user,
  password: token.pass,
  port: token.port,
  database: 'finedust'
})
const area = ['서울', '부산', '대구', '인천', '광주', '대전', '울산', '경기', '강원', '충북', '전북', '전남', '경북', '경남', '제주', '세종']
for (let index = 0; index < area.length; index++) {
  console.log(area[index]);
  let res = request('GET',
    'http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?'
    + 'serviceKey=XZlKvm31hvQ%2FTKvWMQON1daWLiU8dnWjLetAIalzni%2BuuW7ii8TY5B65UanguoVAgBbTggKAcxz8TR6B%2BE%2FJ7A%3D%3D'
    + '&numOfRows=10'
    + '&pageNo=1'
    + '&sidoName=' + urlencode(area[index])
    + '&_returnType=json',
    {
      headers: {
        'user-agent': 'example-user-agent',
      }
    }
  );

  console.log(res.getBody())
  let list = JSON.parse(res.getBody()).list
  console.log(`Data Length : ${list.length}`)
  for (let i = 0; i < list.length; i++) {
    console.log(list[i])
    let query_string = 'insert into orgnized_data values('
      + `"${((list[i].stationName).replace(/\(.*\)/gi, "")).replace(/\d$/gi, "")}",`
      + `"${area[index]}",`
      + `${Number(list[i].pm10Grade)},`
      + `${Number(list[i].pm10Value)},`
      + `${Number(list[i].pm25Grade)},`
      + `${Number(list[i].pm25Value)},`
      + `"${list[i].dataTime}"`
      + ');'
    console.log(query_string)
    query_string = query_string.replace(/NaN/gi, "-1");
    console.log(query_string)
    let result = connection.query(query_string);
    console.log(result)
  }
};
```

-----

