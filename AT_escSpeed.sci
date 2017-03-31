function [v] = AT_escSpeed(m,r,h)
    // Escape speed from an non-rotating massive body at a certain height
    //
    // CALLING SEQUENCES
    // v = AT_escSpeed(m, r, h)
    //
    // PARAMETERS
    // m:    Mass of the body in kg (e.g. planet)
    // r:    Radius of the body in m (e.g. radius of a planet)
    // h:    Heigth of the object above the body in m (e.g. height of an 
    //       artificial satellite)
    // v:    Escape velocity in m/s
    //
    // DESCRIPTION
    // Calculates minimum speed needed for an object to escape from a 
    // massive body from a definite height. But rotating of the body
    // is unconsidered.
    //
    // In most situations it is impractical to achieve escape velocity 
    // almost instantly, because of the acceleration implied, and also 
    // because if there is an atmosphere the hypersonic speeds involved
    // 
    // The escape velocity relative to the surface of a rotating body depends on 
    // direction in which the escaping body travels. For example, as the Earth's 
    // rotational velocity is 465 m/s at the equator, a rocket launched tangentially
    // from the Earth's equator to the east requires an initial velocity of about 
    // 10.735 km/s relative to Earth to escape whereas a rocket launched tangentially
    // from the Earth's equator to the west requires an initial velocity of about 
    // 11.665 km/s relative to Earth. The surface velocity decreases with the cosine 
    // of the geographic latitude, so space launch facilities are often located as 
    // close to the equator as feasible, e.g. the American Cape Canaveral 
    // (latitude 28°28' N) and the French Guiana Space Centre (latitude 5°14' N).
    //
    // EXAMPLES
    // esc = AT_escSpeed(earth.mass, earth.r, 0) // escape vel. from the earth @sea level
    //
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error("Wrong anount of parameters"); end
    if r+h == 0 then error("h + r must not be zero!"); end

    if ~exists("AT_astroconst_loaded") then 
        error("AT_astroconst() is not available, call AT_astroconst()")
    end
    
    g = AT_gravity(m,r,h);
    v = sqrt(2 .* g .* r);
endfunction
