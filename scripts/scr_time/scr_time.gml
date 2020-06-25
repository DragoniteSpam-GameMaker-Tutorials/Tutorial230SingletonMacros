#macro Time (__get_static_time())

function __get_static_time() {
    static inst = undefined;
    
    if (inst == undefined) {
        inst = {
            dt: delta_time / 1000000,
            frames: 0,
            total_time: current_time / 1000,
            
            Update: function() {
                dt = delta_time / 1000000;
                frames++;
                total_time = current_time / 1000;
            },
        };
    }
    
    return inst;
}