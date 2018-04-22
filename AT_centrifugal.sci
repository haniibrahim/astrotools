function [F] = AT_centrifugal(m, r, v, o)
    //
    // Centrifugal force from trajectory OR angular speed
    //
    // CALLING SEQUENCES
    // F = AT_centrifugal(m, r, v)
    // F = AT_centrifugal(m, r, v=value)
    // F = AT_centrifugal(m, r, o=value)
    //
    // (The first two sequences are handled equally)
    //
    // PARAMETERS
    // m: Mass of the object in kg
    // r: Radius in m
    // v: Track speed in m/s (as key=value)
    // o: Angular speed in °/s (as key=value)
    // F: Centrifugal force in N
    //
    // DESCRIPTION
    // Calculates the centrifugal force for an given trajectory OR angular speed.
    // (Make use of key=value parameter commitment)
    //
    // EXAMPLES
    // AT_astroconst();
    // F_cent = AT_centrifugal(80, %earth.r, v=463) // Centrifugal force at earth's equator (trajectory speed used)
    // F_cent = AT_centrifugal(80, %earth.r, o=0.00417) // Centrifugal force at earth's equator (angular speed used)
    //
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error(39); end
    if r == 0 then error("Radius must not be zero!"); end
    
    if exists("v","local") then F = m * v**2 ./ r; end
    if exists("o","local") then 
        o = o .* 2 .* %pi ./ 360 // grad -> rad
        F = m * o**2 .* r; 
    end
endfunction
