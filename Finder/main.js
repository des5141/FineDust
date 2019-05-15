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