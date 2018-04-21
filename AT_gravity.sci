function  [grav] = AT_gravity(m, r, h)
    //
    // Gravity effected on an object above a massive body
    //
    // CALLING SEQUENCES
    // grav = AT_gravity(m, r, h)
    //
    // PARAMETERS
    // m:    Mass of the massive body in kg (e.g. planet)
    // r:    Radius of the body in m (e.g. radius of a planet)
    // h:    Height of the object above the body in m (e.g. height of an 
    //       artificial satellite)
    // grav: Gravity effected on the object in m/s^2
    //
    // DESCRIPTION
    // Calculates the gravity effected on an object at a particular height
    // above an massive body
    //
    // EXAMPLES
    // gravIss = AT_gravity(%earth.mass, %earth.r, 400000) // Gravity on ISS
    //
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error(39); end
    if r+h == 0 then error("h + r must not be zero!"); end
    
    if ~exists("AT_astroconst_loaded") then 
        error("AT_astroconst() is not available, call AT_astroconst()")
    end

    grav = %gen.G .* m ./ (r+h).^2;
endfunction
