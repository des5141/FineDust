/// @description Add a line
ds_list_add(lines, to_add);
ds_list_add(lines_color, to_add_col);
if (ds_list_size(lines) > max_lines) {
    ds_list_delete(lines, 0);
    ds_list_delete(lines_color, 0);
}

