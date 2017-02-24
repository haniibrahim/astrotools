// Orbitalspeed in m/s
//
// m = Mass of the heaviest object in kg
// r = distance at which the speed is to be calculated in m
// a = length of the semi-major axis of the elliptical orbit. For the Earth at perihelion in m
//
// v = orbital speed in m/s

function [v] = AT_orbitalspeed(m, r, a)
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error("Wrong amount of parameters"); end
    if ~exists("AT_astroconst_loaded") then 
        warning("off")
        exec("./AT_astroconst.sci",-1); 
        warning("on")
        AT_astroconst();
    end
    v = sqrt(gen.G + m .* (2/r - 1/a));
    return;
endfunction
