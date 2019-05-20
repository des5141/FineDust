//scr_display_resize()

Ratio = 1;


if (obj_display.Fullscreen || browser_height < Game_Height)
{
Ratio = browser_height/Game_Height;
}

Ratio = max(Ratio, 0.5);

window_set_size(round(Game_Width*Ratio), round(Game_Height*Ratio));

surface_resize(application_surface, round(Game_Width*Ratio), round(Game_Height*Ratio));


alarm[0] = 1;


