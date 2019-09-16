draw_set_color(c_white);
draw_rectangle(room_width - 170, room_height - 70, room_width - 20, room_height - 20, false);
draw_set_color(c_black);
draw_rectangle(room_width - 170, room_height - 70, room_width - 20, room_height - 20, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_text);

if(click) {
    for(var i = 0; i < array_length_1d(list); i++) {
        draw_set_color(c_white);
        draw_rectangle(room_width - 170, room_height - 70 - ((i+1)*60), room_width - 20, room_height - 20 - ((i+1)*60), false);
        draw_set_color(c_black);
        draw_rectangle(room_width - 170, room_height - 70 - ((i+1)*60), room_width - 20, room_height - 20 - ((i+1)*60), true);
        draw_text(room_width-20-75, room_height-20-25 - (i+1)*60, string_hash_to_newline(list[i]));
    }
}

draw_text(room_width-20-75, room_height-20-25, string_hash_to_newline("설정"));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

