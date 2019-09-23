/// @description Draw the entry box

//Line
draw_set_font(fnt_text);
draw_set_color(c_black);
draw_text(x, y, string_hash_to_newline("Enter your name: " + string_replace_all(my_string, "#", "\\#") + string_repeat("|", caret_on)));


