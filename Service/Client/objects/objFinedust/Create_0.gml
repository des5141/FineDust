event_inherited()

/// variables init
area = "제주"
name = "이도동"
timestamp = ""
pm10grade = -1
pm10value = -1
pm25grade = -1
pm25value = -1

var json_data = ds_map_create();
ds_map_add(json_data, "id", 1);
var json_data2 = ds_map_create();
ds_map_add(json_data2, "area", area);
ds_map_add(json_data2, "name", name);
ds_map_add(json_data, "msg", json_encode(json_data2));
var body = json_encode(json_data);
ds_map_destroy(json_data2);
ds_map_destroy(json_data);
gmsio_send_message(body);

/// init 2
min_width = width;
min_height = height;

