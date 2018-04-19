function [az,alt] = AT_altazPos(cjd, loc, bname)
    //
    // Altitude and azimuth position of a celestial body viewed from 
    // earth
    //
    // CALLING SEQUENCES
    // [alt,az]=altazPos(cjd,loc,bname)
    //
    // PARAMETERS
    // cjd:     TREF time scale - Modified (1950.0) julian day 
    // loc:     Row vector of local elliptical (geodetic) coordinates
    //          [longitude; latitude; altitude] in [deg;deg;m]
    // bname:   Name of the celestial body (string, see below)
    // alt:     Position in altitude (elevation) [deg]
    // az:      Position in azimuth [deg]
    //
    // Available bodies are: "Mercury", "Venus", "Earth-Moon-bary" 
    // (or "EMB"), "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", 
    // "Pluto", "Moon", "Sun", "Earth", "solar-sys-bary" (or "SSB")
    //
    // DESCRIPTION
    // Calculates the alitude and azimuth in degrees of a celestial body
    // (planet of the solar system) using JPL's DE405 ephemerides 
    // viewed from topocentric position on earth. 
    // azimuth: 0° is north, 90° is east, 180° is west, 270° is west
    // altitude: Angle in degree obove horizon
    // Src: http://www.bernd.ragutt.de/himmelsmechanik/sonnemondplaneten/
    //
    // EXAMPLES
    // [alt,az]=AT_altazPos(CL_dat_cal2cjd(2008,10,25,15,30,0), ..
    //   [6.9;51.1;30],"Mars")
    // [alt,az]=AT_altazPos(21482.646, [6.9;51.1;30],"Mars")
    //
    inarg = argn(2); // number of parameters/arguments
    if inarg ~= 3 then error(39); end
    
    AT_isCelestlab(); // Check if toolbox Celestlab is installed
    
    // convert deg to rad of geodetic coordinates "loc"
    loc(1) = CL_deg2rad(loc(1)); // long
    loc(2) = CL_deg2rad(loc(2)); // lat
    
    pos_ECI=[];
    pos_ECI=AT_getBodyPosECI(bname,cjd); // get position of bname in ECI 
    pos_ECF=CL_fr_convert("ECI","ECF",cjd,pos_ECI); // convert to ECF
    loc_car=CL_co_ell2car(loc); // transform elliptical to cartesian coordinates
    
    // get the transformation matrix to the local topocentric north frame:
    //    X: unit vector in the horizontal plane and towards north
    //    Y: unit vector in the horizontal plane and towards west
    //    Z: unit vector in the direction of the local vertical
    M_topoN=CL_fr_topoNMat(loc);
    
    // transform the position of bname to the local topocentric north
    // frame in cartesian coordinates
    pos_topoN=M_topoN * (pos_ECF-loc_car);
    
    // transfor cartesian to spherical (alt-az) coordinates
    pos_topoN_sph=CL_co_car2sph(pos_topoN);
    
    // return the azimuth and alt (elevation) of bname in deg
    az=360-CL_rad2deg(pos_topoN_sph(1));
    alt=CL_rad2deg(pos_topoN_sph(2));
endfunction
