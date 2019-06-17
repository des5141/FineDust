"use strict"
function replaceAll(str, searchStr, replaceStr) {
  return str.split(searchStr).join(replaceStr);
}

function get_meal(type, _year, _month, _day) {
  var JSSoup = require('jssoup').default;
  var request = require('sync-request');
  var data = "";
  var extract_array = new Array();
  var extract_string = "";
  var url = `http://www.gsm.hs.kr/xboard/board.php?tbnum=8&sYear=${_year}&sMonth=${_month}`;

  var res = request('GET', url);
  var html = res.getBody('utf8');

  // get html
  var soup = new JSSoup(html);
  var lists = soup.findAll('div', 'food_list_box');
  lists = (lists.toString()).split(`<div class="day_num">${_day}<span>`)[1].split(`<div class="day_num">`)[0];
  lists = replaceAll(lists, "<br></br>", "");
  lists = replaceAll(lists, "&nbsp", "");
  var morning = lists.split(`title="${type}"`)[1].split(`<span class="content">`)[1].split(`</span>`)[0].split("에너지")[0].split(";");
  morning.forEach(element => {
    if (element.search("\n") != -1)
      data += element.split("\n")[1] + "\n";
    else
      data += element + "\n";
  });
  data = replaceAll(data, "*", "").split("\n");
  for (var i = 0; i < data.length; i++) {
    if (data[i] != '')
      extract_array.push(data[i]);
  };
  for (var i = 0; i < extract_array.length; i++) {
    if (i == extract_array.length - 1)
      extract_string += extract_array[i];
    else
      extract_string += extract_array[i] + "\n";
  }
  return extract_string
}


let year = 2019;
let month = 6;
let day = 18;

console.log(get_meal("아침", year, month, day) + "\n\n");
console.log(get_meal("점심", year, month, day) + "\n\n");
console.log(get_meal("저녁", year, month, day));