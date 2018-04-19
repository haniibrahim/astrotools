function [pos_ECI] = AT_getBodyPosECI(bname, cjd)
    //
    // Get the celestial body positions in ECI frame
    //
    // CALLING SEQUENCES
    // [pos_ECI] = AT_getBodyPos(bname, cjd)
    //
    // PARAMETERS
    // bname:   Name of the celestial body
    // cjd:     TREF time scale
    // pos_ECI: Position of the body (bname) for the origin body (origin)
    //          in ICRS frame
    //
    // Available bodies are: "Mercury", "Venus", "Earth-Moon-bary" 
    // (or "EMB"), "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", 
    // "Pluto", "Moon", "Sun", "Earth", "solar-sys-bary" (or "SSB")
    //
    // DESCRIPTION
    // Get the positions of a celestial body in Earth-centered 
    // inertial (ECI) frame using JPL's DE405 ephemerides.
    // Src: http://www.bernd.ragutt.de/himmelsmechanik/sonnemondplaneten/
    //
    // EXAMPLES
    // [pos_ECI] = AT_getBodyPos("Mars, 21915)
    //
    inarg = argn(2); // number of parameters/arguments
    if inarg ~= 2 then error(39); end
    AT_isCelestlab(); // Check if toolbox Celestlab is installed
    // Get the positions of a celestial body for the earth 
    // in International Celestial Reference (ICRS)
    pos_ICRS = CL_eph_de405(bname,cjd, "Earth");
    // Transform ICRS to ECI frame
    pos_ECI = CL_fr_convert("ICRS","ECI",cjd,pos_ICRS);
endfunction
