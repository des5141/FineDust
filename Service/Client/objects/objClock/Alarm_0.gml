/// @description  variables init
if(current_second != time) {
    var dif = current_second - time;
    if(dif < 0)
        dif = 60 - time + current_second;
    date = date_inc_second(date, dif);
    time = current_second;
}


var _hour = date_get_hour(date);
var _minute = date_get_minute(date);
var _second = date_get_second(date);

if(_hour != hour) {
    hour = _hour;
    animation[0] = 0;
}

if(_minute != minute) {
    minute = _minute;
    animation[1] = 0;
}

if(_second != second) {
    second = _second;
    animation[2] = 0;
}

alarm[0] = 10;

