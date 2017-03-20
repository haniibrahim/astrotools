function [res_r, res_g, res_b] = AT_resolution(ap)
    //
    // Angular resolution of an optic (telescope)
    //
    // CALLING SEQUENCES
    // [res_r, res_g, res_b] = AT_resolution(ap)
    //
    // PARAMETERS
    // ap:    aperature in m
    // res_r: resolution of red light (lamda=656nm) in grad(°)
    // res_g: resolution of green light (lamda=555nm) in grad(°)
    // res_b: resolution of blue light (lamda=400nm) in grad(°)
    //
    // DESCRIPTION
    // Calculates the angular resolution of an optic (telescope) for
    // three wave length of light (red=656nm, green=555nm, blue=400nm)
    // in grad (°).
    //
    // The results are valid for an perfect optic and sky. Getting a
    // more realistic result by multiplicate the results with 1.22. 
    //
    // EXAMPLES
    // [red, green, blue] = AT_resolution(0.15) // 150mm aperature
    // blue  = 0.0001528 // => 0.55"
    // green = 0.0002120 // => 0,76"
    // red   = 0.0002506 // => 0.90"
    //
    
    inarg = argn(2);
    if inarg > 1 | inarg < 1 then error("Wrong amount of parameters"); disp_usage(); end
    
    lam_r = 6.56e-4; // wave length red light in mm
    lam_g = 5.55e-4; // wave length green light in mm
    lam_b = 4e-4;   // wave length blue light in mm
    const = 360 ./ (2 .* %pi) // rad => grad conversion
    
    ap = ap * 1e3; // aperature m => mm
    
    res_r = lam_r ./ ap .* const;
    res_g = lam_g ./ ap .* const;
    res_b = lam_b ./ ap .* const;
    
endfunction
