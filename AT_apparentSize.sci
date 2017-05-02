function [app_size] = AT_apparentSize(obj_size, dist)
    //
    // Calculates the visual angle (angle of sight) or apparent size
    // of an observed object in the distance 
    //
    // CALLING SEQUENCES
    // [app_size] = AT_visualAngle(obj_size, dist)
    //
    // PARAMETERS
    // obj_size: Real size of the object in the distant in m
    // dist:     Distance from the observer to the object in m
    // app_size: Apparent size, visual angle or parallax in °
    //
    // DESCRIPTION
    // Calculates the visual angle (angle of sight) or apparent size
    // of an observed object in the distance. 
    // The moon has a distance of 400,000km and a size of 3,500km. The 
    // apparent size is 0.5°.
    //
    // Example:
    // AT_astroconst()
    // appSize = AT_visualAngle(moon.r*2, moon.dist) // Apparent size of the moon
    //
    inarg = argn(2);
    if inarg > 2 | inarg < 2 then error("Wrong amount of parameters"); end
    
    AT_checkCelestlab();
    
    app_size = 2 .* atan(obj_size/(2 .* dist));
    app_size = CL_unitConvert(app_size, "rad","deg")
endfunction
