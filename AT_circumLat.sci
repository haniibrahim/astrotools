function [U] = AT_circumLat(lat, r)
    //
    // Calculates the cirumference of a sphere at a certain latitude
    //
    // CALLING SEQUENCES
    // [U] = AT_circumLat(lat, r)
    // [U] = AT_circumLat(lat)
    //
    // PARAMETERS
    // lat: latitude in degrees (°)
    // r:   Radius of the sphere, e.g radius of the earth (OPTIONAL)
    //      When r is not committed r = mean radius of the earth
    // U:   Circumference of the sphere with the radius "r" at latitude "lat"
    // 
    // DESCRIPTION
    // Calculate the circumfence of a sphere at a certain latitude. E.g. to 
    // get the circumfence of the earth at your home town to calculate the local
    // orbital speed
    //
    // EXAMPLES
    // U = AT_circumLat(52.5) // Circumfence of the earth at Berlin, Germany
    // U = AT_circumLat(52.5, %earth.r) // the same as above
    //
    inarg = argn(2);
    if inarg > 2 | inarg < 1 then error(39); end
    if ~exists("r","local") then
        AT_checkAstroconst();
        r = %earth.r; // Radius of earth if no specific radius was committed
    end
    U = 2 .* %pi .* cos(lat*%pi/180) .* r;
endfunction
