/// @description  mouse event
if(mouse_x > x - width/2)and(mouse_x < x + width/2)and(mouse_y > y - height/2)and(mouse_y < y + height/2)
    over = true;
else
    over = false;
    
if(mouse_check_button_pressed(mb_left)) {
    with(parWidget) {
        depth++;
    }
    
    if(over) {
        if(mouse_x < x - width/2 + 20)and(mouse_x > x - width/2)and(mouse_y < y - height/2 + 20)and(mouse_y > y - height/2)
            instance_destroy();
        else if(mouse_x > x + width/2 - 20)and(mouse_x < x + width/2)and(mouse_y > y + height/2 - 20)and(mouse_y < y + height/2) {
            scale = true;
            base_position[0] = width
            base_position[1] = height
            base_position2[0] = x
            base_position2[1] = y
            base_point[0] = mouse_x
            base_point[1] = mouse_y
        }else {
            scale = false;
            base_position[0] = x
            base_position[1] = y
            base_point[0] = mouse_x
            base_point[1] = mouse_y
        }
        click = true;
        depth = 0;
    }
}

if(mouse_check_button_released(mb_left)) {
    click = false;
}

if(click) {
    if(scale) {
        var mx = mouse_x, my = mouse_y;
        width = max(min_width, base_position[0] - (base_point[0] - mx))
        height = max(min_height, base_position[1] - (base_point[1] - my))
        x = base_position2[0] - (base_position[0] - width)/2
        y = base_position2[1] - (base_position[1] - height)/2
    }else {
        x = base_position[0] - (base_point[0] - mouse_x)
        y = base_position[1] - (base_point[1] - mouse_y)
    }
}

