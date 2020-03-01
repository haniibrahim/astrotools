function h= AT_curvevis(r, alpha)
// Altitude where the full curvature of a body is visable
// r: radius of the object (planet) in m
// alpha: Viwing angle of camera/eye in °
// h:altitde where the whole curvature is visable
// https://youtu.be/hHC_S9wb-xA?t=843

    h = r .* (1/sin(CL_deg2rad(alpha)./ 2) - 1);
    
endfunction
