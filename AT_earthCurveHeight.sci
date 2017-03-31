function [h2] = AT_earthCurveHeight(h1, dist, refr)
    //
    // Calculates how much a distant object is obscured by the earth's 
    // curvature
    //
    // CALLING SEQUENCES
    // h2 = AT_earthCurveHeight(h1, dist, refr)
    // h2 = AT_earthCurveHeight(h1, dist)
    //
    // PARAMETERS
    // h1:   Eye height in m
    // dist: Target distance in m
    // refr: Atmospheric refraction (OPTIONAL), 1.13 is common 
    // h2:   Target hidden height in m
    //
    // DESCRIPTION
    // Calculates how much a distant object is obscured by the earth's 
    // curvature. If "refr" is not committed no refraction is considered.
    // The atmospheric refraction can vary a lot but 1.13 is a common 
    // value.
    // Src: https://github.com/dizzib/earthcalc
    //

    inarg = argn(2);
    if inarg > 3 | inarg < 2 then error("Wrong amount of parameters"); end
    if inarg == 2 then
        refr = 1; // No terrestrial refraction
    end
    if ~exists("AT_astroconst_loaded") then 
        error("AT_astroconst() is not available, call AT_astroconst()")
    end

    R = earth.r;
    d1 = sqrt(h1**2 + 2 .* R .* h1);
    h2 = sqrt((dist-d1)**2 + R**2) - R;
endfunction 
