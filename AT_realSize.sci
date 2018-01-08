function [obj_size] = AT_realSize(app_size, dist)
    //
    // Calculates the real size of an object in the distance from
    // the apparent size 
    //
    // CALLING SEQUENCES
    // [obj_size] = AT_realSize(app_size, dist)
    //
    // PARAMETERS
    // app_size: Apparent size, visual angle or parallax in °
    // dist:     Distance from the observer to the object in arbitrary 
    //           unit
    // obj_size: Real size of the object in the same unit used for dist
    //
    // DESCRIPTION
    // Calculates the real size of an object in the distance from
    // the apparent size (in °) and the distance
    // The galaxy M51 has a distance of 31Mly and an apparent size of
    // 0.19°. The real size is approx. 103000ly.
    //
    // Example:
    // obj_size = AT_realSize(0.19, 31e6) // Real size of galaxy M51
    //
    inarg = argn(2);
    if inarg > 2 | inarg < 2 then error(39); end
    
    AT_checkCelestlab();
    
    app_size = CL_unitConvert(app_size, "deg","rad")
    obj_size = 2 .* dist * tan(app_size/2);
endfunction
