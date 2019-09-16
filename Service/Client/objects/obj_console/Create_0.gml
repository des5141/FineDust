/// @description Configs
margin = 32;
padding = 8;
width = room_width - margin*2;
height = room_height - margin*2 - 56;

///Setup
lines = ds_list_create();
lines_color = ds_list_create();

//Calculate max # of lines
draw_set_font(fnt_text);
var teststr = "M";
max_lines = 1;
while (string_height(string_hash_to_newline(teststr)) < height) {
    teststr += "#M";
    max_lines++;
}

