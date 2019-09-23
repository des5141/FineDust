/// @description 
draw_self()
draw_set_alpha(alpha*0.7)
draw_set_color(c_white)
draw_rectangle(0, 0, room_width, room_height, false)
draw_set_alpha(alpha)
draw_set_color(c_black)
draw_set_font(font0)
draw_text(100, 850, "2019. 09. 23. MON")
draw_set_font(font011)
draw_text(100, 950, "TODAY - GOOD : 25 (AIRKOREA)")
draw_set_halign(fa_right)
draw_text(room_width - 100, 900, login_string+"\n광주 송정")
draw_text(room_width - 100, 100 + alpha*100, "2019년 9월 23일 월요일의 저녁 식단표\n- 피자소스커틀렛\n- 비트양파피클\n- 배추김치\n- 양송이크림스프\n- 야쿠르트\n- 모듬과일샐러드\n- 백미밥");
draw_set_alpha(1)
draw_set_halign(fa_left)
draw_text(100, -100 + 200*step, "ALARM! " + string(count) + "- This message from server")
x = lengthdir_x(point_distance(room_width/2, room_height/2, mouse_x, mouse_y), point_direction(room_width/2, room_height/2, mouse_x, mouse_y))/50+room_width/2
y = lengthdir_y(point_distance(room_width/2, room_height/2, mouse_x, mouse_y), point_direction(room_width/2, room_height/2, mouse_x, mouse_y))/50+room_height/2