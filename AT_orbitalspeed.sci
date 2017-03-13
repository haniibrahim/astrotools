function [v] = AT_orbitalspeed(m, r, a)
//
// Orbital speed of an object orbitting a body at a particular height
//
// CALLING SEQUENCES
// v = AT_orbitalspeed(m, r, a)
//
// PARAMETERS
// m: Mass of the heaviest object in kg
// r: distance at which the speed is to be calculated in m
// a: length of the semi-major axis of the elliptical orbit. 
//    For the Earth at perihelion in m
// v: orbital speed in m/s
//
// DESCRIPTION
// Calculate the oribital speed of an object (e.g. spaceship) 
// orbitting a massive body (planet) at aparticular height.
//
// EXAMPLES
// v = AT_orbitalspeed(earth.mass, 400000, earth.per)
//
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error("Wrong amount of parameters"); end
    if ~exists("AT_astroconst_loaded") then 
        error("AT_astroconst() is not available, call AT_astroconst()")
    end
    v = sqrt(gen.G + m .* (2/r - 1/a));
    return;
endfunction
