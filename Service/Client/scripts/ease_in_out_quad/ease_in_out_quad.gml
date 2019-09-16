/// @description ease_in_out_quad(value)
/// @param value
var t = argument0 * 2;

if (t < 1)
 return 0.5 * t * t;

t -= 1;

return -0.5 * (t * (t - 2) - 1);
