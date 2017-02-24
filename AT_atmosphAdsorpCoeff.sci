// Atmosheric adsorption coefficient
// Minimum contrast for visability is set to 0.02 (2%)
// https://de.wikipedia.org/wiki/Sichtweite
//
// dist  = Visual distance in m
// sigma = Atmosheric adsorption coefficient in m**(-1)

function [sigma] = AT_atmosphAdsorbCoeff(dist)
    
    sigma = -log(0.02)/dist
    
endfunction
