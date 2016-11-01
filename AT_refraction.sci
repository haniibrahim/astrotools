// Atmospheric refraction
// Formular by G.G. Bennett from Meeus, Astronomical Algorithm SE,1998
// for observation at sea level, p=1.010hPa,T=283.15K
//                 1
// R = -------------------------
//         (          7.31     )
//     tan ( h_s + ----------- )
//         (        h_s + 4.4  )
//
// h_s: apparent altitude of the astronomical body in °
// R:   Atmospheric refraction in °

function [R] = AT_refraction(h_s)
    inarg = argn(2);
    if inarg > 1 | inarg < 1 then error("Wrong amount of parmeters"); end
    
    R = 1 ./tan((h_s +(7.31 ./(h_s+4.4)))*%pi/180);
    R = R ./ 60; // " to °
    
    return;    
endfunction
