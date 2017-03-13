function [v] = AT_fallvelo(h, a)
//
// Calculates the fall velocity of a body at a particular height
//
// CALLING SEQUENCES
// v = AT_fallvelo(h, a)
// v = AT_fallvelo(h)
//
// PARAMETERS
// h: Height in m
// a: Acceleration in m/s² (optional), if not specified a = 9.80665
// v: fall velocity in m/s
//
// DESCRIPTION
// Calculate the fall velocity of a body at a particular height with
// a particular gavity/accelleration
//
    inarg = argn(2);
    if inarg > 2 | inarg < 1 then error("Wrong amount of parameters"); end
    if inarg ==1 then a = 9.80665; end // a=g
    v = sqrt(2 .* a .* h)
endfunction

