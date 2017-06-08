function [h1, hrz] = AT_earthCurveHeight(h0, dist, refr)
    //
    // Calculates how much a distant object is obscured by the earth's 
    // curvature
    //
    // CALLING SEQUENCES
    // h1 = AT_earthCurveHeight(h0, dist, refr)
    // h1 = AT_earthCurveHeight(h0, dist)
    // [h1, hrz] = AT_earthCurveHeight(h0, dist, refr)
    // [h1, hrz] = AT_earthCurveHeight(h0, dist)
    //
    // PARAMETERS
    // h0:   Eye level in m
    // dist: Object distance in m
    // refr: Terrestrial refraction (OPTIONAL), 1.13 is common 
    // h1:   Object obscured in m
    // hrz:  Distance to horizon
    //
    // DESCRIPTION
    // Calculates how much a distant object is obscured by the earth's 
    // curvature. If "refr" is not committed no refraction is considered.
    // The atmospheric refraction can vary a lot but 1.13 is a common 
    // value.
    // Src: https://github.com/dizzib/earthcalc
    //
    // EXAMPLES
    // Obscured height of an object 50km away from 1.6m eye level and 
    // distance to the horizon from 1.6m eye level, terrestrial refraction
    // of 13% was considered.
    //
    // [hiddenHeight, distHorizon] = AT_earthCurveHeight(1.6, 50000, 1.13)
    //

    inarg = argn(2);
    if inarg > 3 | inarg < 2 then error(39); end
    if inarg == 2 then
        refr = 1; // No terrestrial refraction
    end

    AT_checkAstroconst();

    R = earth.r;
    hrz = sqrt(h0 .^ 2 + 2 .* R .* h0) .* refr;

    if hrz >= dist then // When target distance is within horizon distance
        h1 = 0;
    else
        h1 = sqrt((dist-(hrz ./ refr)) .^ 2 + R .^2) - R; // hrz/refr: to get the refraction-free length, refraction is considered later
        h1 = h1 ./ refr; 
    end

endfunction 
