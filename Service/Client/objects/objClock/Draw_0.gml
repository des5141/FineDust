event_inherited()

draw_set_font(fontClock);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x - 100, y + 25 - ease_out_circ(animation[0])*50, string_hash_to_newline(string_padding(string(hour), 2, "0")));
draw_text(x, y  + 25- ease_out_circ(animation[1])*50, string_hash_to_newline(string_padding(string(minute), 2, "0")));
draw_text(x + 100, y + 25 - ease_out_circ(animation[2])*50, string_hash_to_newline(string_padding(string(second), 2, "0")));

draw_set_color(c_gray);
draw_set_font(fnt_text);
draw_text(x, y + 25, string_hash_to_newline(date_date_string(date)));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

