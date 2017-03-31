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


    sigma = -log(0.02)/dist

endfunction
