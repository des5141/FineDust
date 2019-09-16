/// @description Paint
var status = gmsio_status();
if (status != gmsio_status_connected) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_text);
    draw_set_color(c_black);
    if (status == gmsio_status_disconnected) {
        draw_text(room_width/2, room_height/2, string_hash_to_newline("Failed to connect. Press R to retry."));
    }
    else if (status == gmsio_status_connecting) {
        draw_text(room_width/2, room_height/2, string_hash_to_newline("Connecting..."));
    }
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

