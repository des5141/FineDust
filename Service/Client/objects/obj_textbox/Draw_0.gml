/// @description Draw the entry box

//Box
draw_set_color(c_white);
draw_rectangle(x-padding, y-padding, x+width+padding, y+height+padding, false);
draw_set_color(c_black);
draw_rectangle(x-padding, y-padding, x+width+padding, y+height+padding, true);

//Line
draw_set_font(fnt_text);
draw_set_color(c_black);
draw_text(x, y, string_hash_to_newline(string_replace_all(my_string, "#", "\\#") + string_repeat("|", caret_on)));


