function [v] = AT_orbitalspeed(r, a, M, m)
    //
    // Orbital speed of an object orbitting a body at a particular height
    //
    // CALLING SEQUENCES
    // v = AT_orbitalspeed(r, a, M, m)
    // v = AT_orbitalspeed(r, a, M)
    // v = AT_orbitalspeed(r, M)
    //
    // PARAMETERS
    // r: distance at which the speed is to be calculated in m
    // a: length of the semi-major axis (perihelion) of the elliptical 
    //    orbit in m. (OPTIONAL)
    // (on circular orbits r = a)
    // M: Mass of the heavier object in kg
    // m: Mass of the lighter object in kg (OPTIONAL)
    // v: orbital speed in m/s
    //
    // DESCRIPTION
    // Calculate the orbital speed of an object (e.g. satellite) 
    // orbitting a massive body (planet) at a particular height.
    //
    // The mass (m) of the lighter object can be omitted if the 
    // differenz to the heavier one is huge.
    //
    // On circular orbits a is equal to r.
    //
    // EXAMPLES
    // v = AT_orbitalspeed(earth.r + 4e5, earth.mass) // Orbital speed of ISS
    // v = AT_orbitalspeed(earth.per, earth.dist, sun.mass, earth.mass) // Orbital speed of the earth at perihelion
    //
    inarg = argn(2);
    if inarg > 4 | inarg < 2 then error("Wrong amount of parameters"); end
    if inarg == 3 then m = 0; end
    if inarg == 2 then 
        M = a; // 2nd parameter is M instead of a when only 2 parameters are commited
        m = 0; // M >>> m
        a = r; // circular orbit
    end
    if ~exists("AT_astroconst_loaded") then 
        error("AT_astroconst() is not available, call AT_astroconst()")
    end
    v = sqrt(gen.G .* (M + m) .* (2 ./ r - 1 ./ a));
    return;
endfunction
