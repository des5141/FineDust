if(mouse_x > room_width-170)and(mouse_x < room_width-20)and(mouse_y > room_height-70)and(mouse_y < room_height-20)
    over = true;
else
    over = false;

if(mouse_check_button_released(mb_left)) {  
    click = false;

    if(over) {
        click = true;
    }
}

if(mouse_check_button_pressed(mb_left)) {
    if(click) {
        for(var i = 0; i < array_length_1d(list); i++) {
            if(mouse_x > room_width-170)and(mouse_x < room_width-20)and(mouse_y > room_height-70-((i+1)*60)and(mouse_y < room_height-20-((i+1)*60))){
                event(i);
            }
        }
        
        if(mouse_x > room_width-170)and(mouse_x < room_width-20)and(mouse_y > room_height-70)and(mouse_y < room_height-20) {
            click = false;
            over = false;   
        }
    }
}

if(mouse_check_button(mb_left)) {

}



