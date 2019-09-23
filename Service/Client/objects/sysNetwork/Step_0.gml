/// @description Monitor running status
if active {
    var status = gmsio_status();
	
    // Connection broke
    if (status == gmsio_status_disconnected) {
        with (obj_login) { instance_destroy(); }
        active = false;
        visible = true;
    }
    
    if (status == gmsio_status_connected) {
        if (room != rmMain)
            room_goto(rmMain)
    }
}

/// Receiving data
if (gmsio_status() == gmsio_status_connected) {
    while (gmsio_has_message()) {
        //Decode response
        var json_data = json_decode(gmsio_get_message());
        //var message_id = ds_map_find_value(json_data, "id");
        //var message_body = ds_map_find_value(json_data, "msg");
        ds_map_destroy(json_data);
        
        //Route between different functions
        /*switch (message_id) {
            case 1:
                message_body = json_decode(message_body);
                obj_finedust.timestamp = ds_map_find_value(message_body, "timestamp");
                obj_finedust.pm10grade = ds_map_find_value(message_body, "pm10grade");
                obj_finedust.pm10value = ds_map_find_value(message_body, "pm10value");
                obj_finedust.pm25grade = ds_map_find_value(message_body, "pm25grade");
                obj_finedust.pm25value = ds_map_find_value(message_body, "pm25value");
                ds_map_destroy(message_body);
            break;
            
            default:
            
            break;
        }*/
    }
}

