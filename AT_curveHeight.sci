function [h1, hrz] = AT_curveHeight(h0, dist, refr, r)
    //
    // Calculates how much a distant object is obscured by a sphere's 
    // curvature (e.g. earth, moon, etc.)
    //
    // CALLING SEQUENCES
    // [h1, hrz] = AT_curveHeight(h0, dist, refr, r)
    // [h1, hrz] = AT_curveHeight(h0, dist, refr)
    // [h1, hrz] = AT_curveHeight(h0, dist)
    //
    // PARAMETERS
    // h0:   Eye level in m
    // dist: Object distance in m
    // refr: Terrestrial refraction (OPTIONAL), 1.13 is common 
    // r:    Radius of the sphere (OPTIONAL)
    //       if not committed r:=earth's mean radius
    // h1:   Object obscured in m
    // hrz:  Distance to horizon
    //
    // DESCRIPTION
    // Calculates how much a distant object is obscured by curvature
    // of a sphere (e.g. earth). If r is not committed the mean radius
    // of earth is set. If "refr" is not committed no refraction is 
    // considered. The atmospheric refraction can vary a lot but 1.13 
    // is a common value. If you want to commit a radius you can leave
    // refr blank (see 2nd example).
    // Src: https://github.com/dizzib/earthcalc
    //
    // EXAMPLES
    // Obscured height of an object 50km away from 1.6m eye level and 
    // distance to the horizon from 1.6m eye level, terrestrial refraction
    // of 13% was considered. It is a general form of AT_earthCurveHeight.
    //
    // [hiddenHeight, distHorizon] = AT_curveHeight(1.6, 50000, 1.13)
    // [hiddenHeight, distHorizon] = AT_curveHeight(1.6, 50000,, %moon.r)
    //

    inarg = argn(2);
    if inarg > 4 | inarg < 2 then error(39); end
    if inarg == 2 then 
        refr = 1; // No terrestrial refraction
        r = %earth.r; // Earth's mean radius
    end
    if inarg == 3 then 
        r = %earth.r; // Earth's mean radius
    end
    if ~exists("refr") then refr = 1; end
    if refr == 0 then 
        err_refr = "%s: refr (Refraction) has to be greater than 0. No refraction = 1\n\n";
        error(msprintf(gettext(err_refr), "AT_curveHeight"));
    end

    AT_checkAstroconst();

    hrz = sqrt(h0 .^ 2 + 2 .* r .* h0) .* refr;

    if hrz >= dist then // When target distance is within horizon distance
        h1 = 0;
    else
        h1 = sqrt((dist-(hrz ./ refr)) .^ 2 + r .^2) - r; // hrz/refr: to get the refraction-free length, refraction is considered later
        h1 = h1 ./ refr; 
    end

endfunction 
