// Orbital Speed @height on earth
// Src: http://www.n24.de/n24/kolumnen/Prof-Ulrich-Walter-Wissenschaft/d/8893694/weshalb-bremsen-beschleunigt-und-beschleunigen-bremst.html
// h = orbital height in m
// v_orbit = orbital speed in m/s

function [v_orbit] = AT_orbitalspeed_earth(h)
    h = h/1e3; // m to km
    v_orbit = sqrt(398600 ./ (6378 + h)); // v_orbit in km/s
    v_orbit = v_orbit .* 1e3; // km/s to m/s
    return;
endfunction
