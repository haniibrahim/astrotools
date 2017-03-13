function [R_e] = AT_refraction_del(h_o, t, p)
//
// Atmospheric refraction elimination of an observed altitude
//
// CALLING SEQUENCES
// R_e = AT_refraction_del(h_o, t, p)
// R_e = AT_refraction_del(h_o)
//
// PARAMETERS
// h_o: observed altitude of the astronomical body in °
// t:   temperatur in K (OPTIONAL), if not specified t=283K
// p:   pressure in hPa (OPTIONAL), if not specified p=1010hPa
// R:   Atmospheric refraction in °
//
// DESCRIPTION
// Atmospheric refraction from an observed altitude of 
// an astronomical body. Used to elimate the refraction and get the
// real altitude w/o atmospheric influence.
//
// To get the real altitude you have to substract R_e from your
// observed altitude.
//
// Formular by G.G. Bennett from Meeus, Astronomical Algorithm SE,1998
// for observation at sea level, p=1010hPa,T=283.15K
//                  1.02                p       283
// R_e = ------------------------- * ------ * -------
//           (          10.3     )    1010       t
//       tan ( h_o + ----------- )
//           (        h_o + 5.11 )
//

    inarg = argn(2);
    if inarg > 3 | inarg < 1 then error("Wrong amount of parmeters"); end
    if  inarg == 1 then
        p = 1010 // pressure: 1010 hPa
        t = 283  // temperatur: 283 K (10°C)
    end
    if h_o > 90 then error("Angle h_s has to be between 0 and 90°"); end
    
    if h_o == 90 then // Correction for h_o = 90°
        R_e = 0. ;
    else
        R_e = 1.02 ./tan((h_o +(10.3 ./(h_o+5.11)))*%pi ./ 180) * p ./ 1010. * 283 ./ t;
    end
    
    R_e = R_e ./ 60; // " to °
    
    return;    
endfunction
