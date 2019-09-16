/// @description Paint line box

//Box
draw_set_color(c_white);
draw_rectangle(x-padding, y-padding, x+width+padding, y+height+padding, false);
draw_set_color(c_black);
draw_rectangle(x-padding, y-padding, x+width+padding, y+height+padding, true);

//Lines
draw_set_font(fnt_text);
var i, l;
l = ds_list_size(lines);
for (i=0; i<l; i++) {
    draw_set_color(ds_list_find_value(lines_color, i));
    draw_text(x, y, string_hash_to_newline(string_repeat("#", i) + ds_list_find_value(lines, i)));
}

