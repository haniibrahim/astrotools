function AT_astroconst()
    L0 = "";
    L0 = who("local");
    
    //General constants
    gen = struct( ..
        "G", 6.67408D-11, ..    // Gravitationskonstante in m³/(kg*s²) oder in Nm²/kg²
        "c", 299792458, ..      // Lichtgeschwindigkeit im Vacuum in m/s
        "", 0 ..
    );
    
    // Earth constants
    earth = struct( .. 
        "mass", 5.97237e24, ..  // Mass in kg
        "vol", 1.08321e15, ..   // Volume in m**3
        "r", 6.371e6, ..        // Mean radius in m
        "r_eq", 6.3781e6, ..    // Equatorial radius in m
        "r_pol", 6.3568e6, ..   // Polar radius in m
        "g", 9.8066, ..         // Mean gravity in m/s**2
        "p", 1013.25, ..        // Surface pressure ("sea level") in hPa
        "rho", 5514, ..         // Mean density in kg/m**3
        "area", 5.10072e11, ..  // Surface area in m**2
        "area_lnd",1.48940e11,.. // Surface area land in m**2
        "area_h2o",3.61132e11,.. // Surface area water in m**2
        "aph", 1.52100e11, ..    // Aphelion in m
        "per", 1.47095e11, ..    // Pherihelion in m 
        "", 0 .. 
    );
    // Moon constants
//    moon = struct( .. 
//        "mass",7.342e22, ..  // Mass in kg
//        "vol", 2.1958e, ..   // Volume in m**3
//        "r", , ..        // Mean radius in m
//        "r_eq", , ..    // Equatorial radius in m
//        "r_pol", , ..   // Polar radius in m
//        "g", , ..         // Mean gravity in m/s**2
//        "p", , ..        // Surface pressure ("sea level") in hPa
//        "rho", , ..         // Mean density in kg/m**3
//        "area", , ..  // Surface area in m**2
//        "area_lnd",,.. // Surface area land in m**2
//        "area_h2o",,.. // Surface area water in m**2
//        "aph", , ..    // Aphelion in m
//        "per", , .. // Pherihelion in m 
//        "", 0 .. 
//    );
    
    L0 = setdiff(who("local"), L0)
    execstr("["+strcat(L0,",")+"] = resume("+strcat(L0,",")+")")    
endfunction