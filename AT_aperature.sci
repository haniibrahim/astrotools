function [ap_r, ap_g, ap_b] = AT_aperature(res)
    //
    // Needed aperatur to reach given angular resolution of an optic (telescope)
    //
    // CALLING SEQUENCES
    // [ap_r, ap_g, ap_b] = AT_aperature(res)
    //
    // PARAMETERS
    // res:  resolution in grad (°)
    // ap_r: aperature for red light (lamda=656nm) in m
    // ap_g: aperature for green light (lamda=555nm) in m
    // ap_b: aperature of blue light (lamda=400nm) in m
    //
    // DESCRIPTION
    // Calculates the needed aperatur of an telecope to reach a given 
    // resolution in grad (°) for three wave length (red=656nm, green=555nm, 
    // blue=400nm) in m.
    //
    // The results are valid for an perfect optic and sky. Getting a
    // more realistic result by multiplicate the results with 1.22. 
    //
    // EXAMPLES
    // [red, green, blue] = AT_aperature(1/3600) // aperature for 1" resolution
    // blue  = 0.0825059 // => 83 mm
    // green = 0.1144770 // => 115 mm
    // red   = 0.1353097 // => 135 mm
    //
    
    inarg = argn(2);
    if inarg > 1 | inarg < 1 then 
        //error("Wrong amount of parameters"); 
        disp_usage(); 
    end
    
    lam_r = 6.56e-4; // wave length red light in mm
    lam_g = 5.55e-4; // wave length green light in mm
    lam_b = 4e-4;   // wave length blue light in mm
    const = 360 ./ (2 .* %pi) // rad => grad conversion
    
    ap_r = lam_r .* const ./ (res .* 1e3);
    ap_g = lam_g .* const ./ (res .* 1e3);
    ap_b = lam_b .* const ./ (res .* 1e3);
    
endfunction
