function [range] = AT_visualRange(height1, height2, r, refr)
    //
    // Visual range on a spherical body
    //
    // CALLING SEQUENCES
    // range = AT_visualRange(height1, height2, r, refr)
    // range = AT_visualRange(height1, height2, r)
    //
    // PARAMETERS
    // height1: height of eye/instrument in m
    // height2: height of distant object in m
    // r:       Radius of spherical body (e.g. planet)
    // refr:    terrestrial refraction (OPTIONAL)
    //          set to 1 (no refraction) if not committed, 
    //          refr = 1.13 is common value.
    // range = visual range of sight in m
    // (height1 and height2 are interchangable)
    //
    // DESCRIPTION
    // Calculates to which max. distance an object of a specific height can be observed 
    // on a speherical body by an observer of an itself specific height.
    //
    // EXAMPLES
    // AT_astroconst(); range = AT_visualRange(1.5, 100, earth.r, 1.13)
    //
    // A object of 100m height can be observed by an observer with a eye level of 
    // 1.5m to a max. distance of approx. 45.3km when taken a terrestrial refraction 
    // of 13% into account.
    // 

    inarg = argn(2);
    if inarg > 4 | inarg < 3 then error("Wrong amount of parameters"); end
    if inarg == 3 then
        refr = 1; // No terrestrial refraction
    end

    AT_checkAstroconst();
    
    // Simplified form for low heights
    //    f = sqrt(2 * earth.r) * refr;
    //    range = f*(sqrt(height1) + sqrt(height2));

    range = (sqrt(2 .* r .* height1 + height1**2) + sqrt(2 .* r .* height2 + height2**2)) * refr;

endfunction
