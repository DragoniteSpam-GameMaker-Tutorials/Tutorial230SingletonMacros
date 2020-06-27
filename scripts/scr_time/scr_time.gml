#macro Time (__get_static_time())

function __get_static_time() {
    static inst = undefined;
    
    if (inst == undefined) {
        inst = {
            dt: delta_time / 1000000,
            frames: 0,
            total_time: current_time / 1000,
            
            last_update_time: -1,
            
            Update: function() {
                
                if (last_update_time == current_time) return;
                
                dt = delta_time / 1000000;
                frames++;
                total_time = current_time / 1000;
                
                last_update_time = current_time;
            },
        };
    }
    
    inst.Update();
    
    return inst;
}