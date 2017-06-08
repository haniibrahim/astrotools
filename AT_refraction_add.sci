function [R] = AT_refraction_add(h_s, t, p)
    //
    // Atmospheric refraction of an apparent altitude
    //
    // CALLING SEQUENCES
    // R = AT_refraction_add(h_s, t, p)
    // R = AT_refraction_add(h_s)
    //
    // PARAMETERS
    // h_s: apparent altitude of the astronomical body in °
    // t:   temperatur in K (OPTIONAL), if not specified t=283K
    // p:   pressure in hPa (OPTIONAL), if not specified p=1010hPa
    // R:   Atmospheric refraction correction in °
    //
    // DESCRIPTION
    // Atmospheric refraction from an apparent altitude of 
    // an astronomical body to get the observed altitude.
    //
    // To get the observed altitude you have to add R to your
    // calculated altitude.
    //
    // Formular by G.G. Bennett from Meeus, Astronomical Algorithm SE,1998
    // for observation at sea level, p=1010hPa,T=283.15K
    //                 1                  p       283
    // R = ------------------------- * ------ * -------
    //         (          7.31     )    1010       t
    //     tan ( h_s + ----------- )
    //         (        h_s + 4.4  )
    //

    inarg = argn(2);
    if inarg > 3 | inarg < 1 then error(39); end
    if  inarg == 1 then
        p = 1010 // pressure: 1010 hPa
        t = 283  // temperatur: 283 K (10°C)
    end
    if h_s > 90 then error("Angle h_s has to be between 0 and 90°"); end

    if h_s == 90 then // Correction for h_s = 90°
        R = 0. ;
    else
        R = 1 ./tan((h_s +(7.31 ./(h_s+4.4)))*%pi ./ 180) * p ./ 1010. * 283 ./ t;
    end

    R = R ./ 60; // " to °

    return;    
endfunction
