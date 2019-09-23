/// @description Keep line width in check
if (my_string != keyboard_string) {
    if (string_width(string_hash_to_newline("Enter your name: " + keyboard_string)) > width) {
        keyboard_string = my_string;
    }
    else {
        my_string = keyboard_string;
    }
}

