/// @description ease_out_circ(value)
/// @param value
if (argument0 <= 0)
 return 0;
else if (argument0 >= 1)
 return 1;

var t = argument0 - 1;

return sqrt(1 - t * t);
