function [t] = AT_falltime(h, a)
    //
    // Calculates the fall time of a body at a particular height
    //
    // CALLING SEQUENCES
    // [t] = AT_falltime(h, a)
    // [t] = AT_falltime(h)
    //
    // PARAMETERS
    // h: Height in m
    // a: Acceleration in m/s² (optional), if not specified a = 9.80665
    // t: fall time in s
    //
    // DESCRIPTION
    // Calculate the fall time of a body at a particular height with
    // a particular gavity/accelleration w/o air resistance
    //
    inarg = argn(2);
    if inarg > 2 | inarg < 1 then error("Wrong amount of parameters"); end
    if inarg ==1 then a = 9.80665; end // a=g
    t = sqrt(2 .* h ./ a);
endfunction

