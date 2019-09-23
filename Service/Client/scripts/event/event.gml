/// @description event(index);
/// @param index
var ins, ins2, ins3;
switch(argument0) {
    case 0:
        for(var i = 0; i < ds_list_size(global.widget_list); i++) {
            if(i > 0) {
                ins = ds_list_find_value(global.widget_list, i);
                ins.top = false;
                ins2 = ds_list_find_value(global.widget_list, i-1);
                ins.x = ins2.x;
                ins.y = ins2.y + ins2.height/2 + ins.height/2 + 20;
                
                if(ins.width/2 > ins2.width/2) {
                    ins3 = -1;
                    for(var j = i-1; j >= 0; j--) {
                        ins3 = ds_list_find_value(global.widget_list, j);
                        if(ins3.top == true) {
                            break;
                        }
                    }
                    if(ins3 != -1) {
                        ins.x = ins3.x + ins3.width/2 + 20 + ins.width/2;
                        ins.y = 20 + ins.height/2;
                        ins.top = true;
                    }
                }
                
                if(ins.y + ins.height/2 > room_height) {
                    ins.x = ins2.x + ins2.width/2 + 20 + ins.width/2;
                    ins.y = 20 + ins.height/2;
                    ins.top = true;
                }
            }else{
                ins = ds_list_find_value(global.widget_list, 0);
                ins.x = ins.width/2 + 20;
                ins.y = ins.height/2 + 20;
                ins.top = true;
            }
        }
    break;
    
    case 1:
        ins = instance_create_depth(irandom_range(200, room_width-200), irandom_range(200, room_height-200), 0, parWidget);
        ins.width = irandom_range(100, 300);
        ins.height = irandom_range(100, 300);
        widget_pin_size(ins);
    break;
}
