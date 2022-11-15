function shader_set_ext(shader, uniform_struct = undefined){
    
    // Set shader
	shader_set(shader);
	
	// Only set uniforms if we are given a uniform struct. 
	if ( uniform_struct != undefined ){
	    
	    // Get uniform names from struct
        var keys = variable_struct_get_names(uniform_struct);
        
        var i = 0;
        repeat(array_length(keys)){      
            var val = uniform_struct[$ keys[i]];
            
            // We can set uniforms as "functions" and get return values from those functions
    		if ( is_method(val) ) val = val();
    		
    		// Not an array? 
            if ( !is_array(val)){
                
                // Not a struct?
                if ( !is_struct(val) ) {
                    
                    // Single value inputs (floats & samplers)
    	            switch(typeof(val)){
    	                
    	                // 'Pointer' - this is returend when using 'sprite_get_texture' or 'surface_get_texture'
    	                case "ptr" : 
    						var uni = shader_get_sampler_index(shader, keys[i]);
    						texture_set_stage(uni, val); 
    					break;
    					
    					// 'Number' - this is any float value
    	                case "number" : 
    						var uni = shader_get_uniform(shader, keys[i]);
    						shader_set_uniform_f(uni, val); 
    				    break;
    	            }
                } 
                
                // Is a struct?
                else {
                    
                    // grab the "type" and "value" (for use with 'uniform_integer(value)')
                    if ( val.type == "int" ){
                        var uni = shader_get_uniform(shader, keys[i]);
                        if ( is_array(val.value) ) shader_set_uniform_i_array(uni, val.value);
                        else shader_set_uniform_i(uni, val.value);
                    }
                }
            }
            
            // Is array?
            else {
    			var uni = shader_get_uniform(shader, keys[i]);
    			shader_set_uniform_f_array(uni, val);
    		}
    		
    		// Next uniform name
            i++;
        }
	}
}
function uniform_integer(val){
    // Return a struct so that 'shader_set_ext' knows to set the
    // value as an integer/integer array instead of a float/float array
    return { 
        type: "int", 
        value: val 
    };
}
