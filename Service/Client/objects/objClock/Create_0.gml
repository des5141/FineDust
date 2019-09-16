event_inherited()

/// variables init
date = date_current_datetime();
hour = date_get_hour(date);
minute = date_get_minute(date);
second = date_get_second(date);

animation = array_create(3);
time = current_second;

width = 370;
height = 150;

widget_pin_size(id);

x = room_width - width/2 - 20;
y = 20 + height/2;
alarm[0] = 10;
alarm[1] = 60*60;

