// Calculates how much a distant object is obscured by the earth's curvature
// Src: https://github.com/dizzib/earthcalc
//
// h1    = Eye height in m
// dist  = target distance in m
//
// h2    = target hidden height in m

function [h2] = AT_earthCurveHeight(h1, dist, refr)
    inarg = argn(2);
    if inarg > 3 | inarg < 2 then error("Wrong amount of parameters"); end
    if inarg == 2 then
        refr = 1; // No terrestrial refraction
    end
    if ~exists("AT_astroconst_loaded") then 
        warning("off")
        exec("./AT_astroconst.sci",-1); 
        warning("on")
        AT_astroconst();
    end
    
    R = earth.r;
    d1 = sqrt(h1**2 + 2 .* R .* h1);
    h2 = sqrt((dist-d1)**2 + R**2) - R;
endfunction 
