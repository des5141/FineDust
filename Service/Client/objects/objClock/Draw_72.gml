event_inherited()

/// animation
for(var i = 0; i < 3; i++) {
    if(animation[i] < 1) {
        animation[i] += 0.025;
    }else{
        animation[i] = 1;
    }
}

