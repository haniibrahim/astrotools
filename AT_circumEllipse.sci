function [U]=AT_circumEllipse(aph, per)
    //
    // Circumference of an ellipse (Ramanujan approximation)
    //
    // CALLING SEQUENCES
    // [U]=AT_circumEllipse(aph, per)
    //
    // PARAMETERS
    // aph: apogee in m (distance to the greatest point in an elliptical orbit)
    // per: perigee in m (distance to the least point in an elliptical orbit)
    // U:   circumference of ellipse in m
    //
    // DESCRIPTION
    // Calculate the circumference of an ellipse (elliptical orbit) by
    // passing the distances of the least and the greatest points in 
    // the orbit corresponding to Ramanujan approximation.
    // Src: https://www.mathematik.ch/anwendungenmath/ellipsenumfang/
    //
    // EXAMPLES
    // [U]=AT_circumEllipse(%earth.aph, %earth.per)
    // 

    inarg = argn(2); // number of parameters/arguments
    if inarg < 2 | inarg > 2 then error(39); end
    
    ecc = (aph - per) ./ (aph + per); // eccentrtricity
    U = (aph + per) * %pi .* (1 + (3 .* ecc**2) ./ (10 + sqrt(4 - 3 .* ecc**2)));

endfunction
