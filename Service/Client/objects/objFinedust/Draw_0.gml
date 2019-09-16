event_inherited()

draw_set_font(fnt_text)
draw_set_color(c_black)
draw_text(x - width/2 + 20, y - height/2 + 20, string_hash_to_newline(""
+ area + "#"
+ name + "#"
+ timestamp + "#"
+ "pm10grade : " + string(pm10grade) + "#"
+ "pm10value : " + string(pm10value) + "#"
+ "pm25grade : " + string(pm25grade) + "#"
+ "pm25value : " + string(pm25value))
);

