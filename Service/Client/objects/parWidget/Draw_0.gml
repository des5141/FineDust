draw_set_color(c_white);
draw_rectangle(x - width/2, y - height/2, x + width/2, y + height/2, false);

draw_set_color(c_black);

if(click)
    draw_set_color(c_green);
draw_triangle(x + width/2-20, y + height/2, x + width/2, y + height/2-20, x + width/2, y + height/2, false);
draw_set_color(c_red);
draw_triangle(x - width/2, y - height/2+20, x - width/2+20, y - height/2, x - width/2, y - height/2, false);



draw_set_color(c_black);
draw_rectangle(x - width/2, y - height/2, x + width/2, y + height/2, true);
if(click) {
    draw_set_color(c_green);
    draw_rectangle(x - width/2, y - height/2, x + width/2, y + height/2, true);
}


