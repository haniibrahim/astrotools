function [dist] = AT_distSphere(latA, longA, latB, longB, r)
    //
    // Distance on a perfect sphere or real earth via langitude and longitude
    //
    // CALLING SEQUENCES
    // [dist] = AT_distSphere(latA, longA, latB, longB, r)
    // [dist] = AT_distSphere(latA, longA, latB, longB)
    //
    // PARAMETERS
    // latA:   Latitude of the first point (A) in decimal degrees or vector 
    //         of DMS [deg arcmin arcsec]
    // longA:  Longitude of the first point (A) in decimal degrees or vector
    //         of DMS [deg arcmin arcsec]
    // latB:   Latitude of the second point (B) in decimal degrees or vector 
    //         of DMS [deg arcmin arcsec]
    // longB:  Longitude of the second point (B) in decimal degrees or vector
    //         of DMS [deg arcmin arcsec]
    //         (Lat and Long are positive when N and E, and negative 
    //         when S and W)
    // r:      Radius of the sphere in m (OPTIONAL) 
    //            if specified the calculation method "Orthodrome" is used 
    //               (for perfect sphere)
    //            If not specified the calculation method from Thaddeus 
    //               Vincenty is used for a more accurate result on earth 
    //               (accuracy: 50m)
    // dist:   Distance of point A to B in m
    //
    // DESCRIPTION
    // Calculate the distance in m between two points specified
    // with latitude and longitude on a perfect sphere when a radius is 
    // committed (Orthodrome method). W/o radius committed the pole
    // flattened earth is assumed and the more accurate Thaddeus Vincenty
    // method is used for calculation (accuracy: approx. 50m).
    //
    // EXAMPLES
    // // Distance between Berlin and Tokio when earth is a perfect sphere, 
    // // Orthodrome method is used for calculation
    // [dist] = AT_distSphere(52.517, 13.4, 35.7, 139.767)
    // [dist] = AT_distSphere([52 31 0], 13.4, [35 42 0], [139 46 0], %earth.r)
    // // Distance between Berlin and Rio de Janeiro on earth (pole flattening incl.)
    // // Thaddeus Vincenty method is used for calculation
    // [dist] = AT_distSphere([52 31 0], [13 24 0], -22.971, [-43 10 56])
    // 
    
    // Convert degrees/arcmin/arcsec in decimal degrees
    function [ang_dec] = convLatLong(vec)
        ang_dec = vec(1) + vec(2) ./ 60 + vec(3) ./ 3600;
    endfunction
    
    // Method 1: Orthodrome
    function [dist] = orthodrome(latA, longA, latB, longB, r)
        circum = r .* %pi .* 2;
        ang = acos(sin(latA) .* sin(latB) + cos(latA) .* cos(latB) .* cos(longB - longA))
        dist = ang .* circum ./ (360 .* %pi/180);
    endfunction
    
    // Method 2: Vincenty (50m accuraccy) for earth
    function [dist] = vincenty(latA, longA, latB, longB)
        inarg = argn(2); // number of parameters/arguments
        if inarg <> 4 then error(39); end
        f = 1/298.257223563 // pole flattening
        F = (latA + latB) ./ 2;
        G = (latA - latB) ./ 2;
        l = (longA - longB) ./ 2;
        
        S = (sin(G))^2 .* (cos(l))^2 + (cos(F))^2 .* (sin(l))^2;
        C = (cos(G))^2 .* (cos(l))^2 + (sin(F))^2 .* (sin(l))^2;
        w = atan(sqrt(S ./ C));
        D = 2 .* w .* %earth.r_eq;
        
        T = sqrt(S .* C) ./ w;
        H1 = (3 .* T -1) ./ (2 .* C);
        H2 = (3 .* T +1) ./ (2 .* S);
        
        dist = D .* (1 + f .* H1 .* (sin(F))^2 .* (cos(G))^2 - f .* H2 .* (cos(F))^2 .* (sin(G))^2);
    endfunction
        
    
//    // Method 2:
//    function [dist] = haversine(latA, longA, latB, longB, r)
//        deff("hv=hav(ang)","h=(1-cos(ang))/2;"); // haversine function
//        h = hav()
//        dist = 2 .* r .* asin(sqrt(hav()))
//    endfunction
    
    // Main ------------------------------------------    
    inarg = argn(2); // number of parameters/arguments
    if inarg > 5 | inarg < 4 then error(39); end
    if inarg == 4 then
        method = "vincenty";
        AT_isAstroconst();
    else 
        method = "orthodrome"
    end

    // Conversation from vector to decimal format 
    if isvector(latA) then
      latA = convLatLong(latA); 
    end
    if isvector(longA) then
        longA = convLatLong(longA);
    end
    if isvector(latB) then
        latB = convLatLong(latB);
    end
    if isvector(longB) then
        longB = convLatLong(longB);
    end
    
    // deg to rad
    latA  = latA .* %pi ./ 180;
    longA = longA .* %pi ./ 180;
    latB  = latB .* %pi ./ 180;
    longB = longB .* %pi ./ 180;
    
    if method == "orthodrome" then
        [dist] = orthodrome(latA, longA, latB, longB, r);
    elseif method == "vincenty" then
        [dist] = vincenty(latA, longA, latB, longB);
    end
endfunction
