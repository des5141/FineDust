/// @description Non-HTML5 only --- Receive incoming messages

if (os_browser == browser_not_a_browser) { //Just here for future-proofing
    if (ds_map_find_value(async_load, "id") == client) {
        if (ds_map_find_value(async_load, "type") == network_type_data) {
            var buffer = ds_map_find_value(async_load, "buffer");
            ds_queue_enqueue(inbox, buffer_read(buffer, buffer_string));
        }
    }
}

