/// @description 
var i_d = ds_map_find_value(async_load, "id");
if i_d == text
    {
    if ds_map_find_value(async_load, "status")
        {
        if ds_map_find_value(async_load, "result") != ""
            {
            
				login_string = "Welcome, " + ds_map_find_value(async_load, "result");
            }
        }
    }