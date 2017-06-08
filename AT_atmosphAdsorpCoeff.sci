function [sigma] = AT_atmosphAdsorbCoeff(dist)
    //
    // Atmosheric adsorption coefficient
    //
    // CALLING SEQUENCES
    // sigma = AT_atmosphAdsorbCoeff(distance)
    //
    // PARAMETERS
    // dist:  Visual distance in m
    // sigma: Atmosheric adsorption coefficient in m**(-1)
    //
    // DESCRIPTION
    // Minimum contrast for visability is set to 0.02 (2%)
    // https://de.wikipedia.org/wiki/Sichtweite
    //
    inarg = argn(2);
    if inarg > 1 | inarg < 1 then error(39); end

    sigma = -log(0.02)/dist

endfunction
