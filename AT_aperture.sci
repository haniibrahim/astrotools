function [ap_r, ap_g, ap_b] = AT_aperture(res)
    //
    // Needed aperture to reach given angular resolution of an optic (telescope)
    //
    // CALLING SEQUENCES
    // [ap_r, ap_g, ap_b] = AT_aperture(res)
    //
    // PARAMETERS
    // res:  resolution in degree (°)
    // ap_r: aperture for red light (lambda=656nm) in m
    // ap_g: aperture for green light (lambda=555nm) in m
    // ap_b: aperture of blue light (lambda=400nm) in m
    //
    // DESCRIPTION
    // Calculates the needed aperture of an telescope to reach a given 
    // resolution in degree (°) for three wave length (red=656nm, green=555nm, 
    // blue=400nm) in m.
    //
    // If you just call AT_aperture(res) you only get the resolution for 
    // the red light which is the largest of the rgb.
    //
    // The results are valid for an perfect optic and sky. Getting a
    // more realistic result by multiply the results with 1.22. 
    //
    // EXAMPLES
    // [red, green, blue] = AT_aperture(1/3600) // aperture for 1" resolution
    // // blue  = 0.0825059 // => 83 mm
    // // green = 0.1144770 // => 115 mm
    // // red   = 0.1353097 // => 135 mm
    //
    
    inarg = argn(2);
    if inarg > 1 | inarg < 1 then error(39); end
    
    lam_r = 6.56e-4; // wave length red light in mm
    lam_g = 5.55e-4; // wave length green light in mm
    lam_b = 4e-4;   // wave length blue light in mm
    const = 180 ./ %pi // rad => degree conversion
    
    ap_r = lam_r .* const ./ (res .* 1e3);
    ap_g = lam_g .* const ./ (res .* 1e3);
    ap_b = lam_b .* const ./ (res .* 1e3);
    
endfunction
