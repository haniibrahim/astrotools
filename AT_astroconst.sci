function AT_astroconst()
    L0 = "";
    L0 = who("local");
    
    // Constant for checking wheter "AT_astroconst" is loaded or not via "exists()":
    // if ~exists("AT_astroconst_loaded") then 
    //   warning("off")
    //   exec("./AT_astroconst.sci",-1); 
    //   warning("on")
    //   AT_astroconst();
    // end
    AT_astroconst_loaded = 1;
    
    //General constants
    gen = struct( ..
        "G", 6.67408D-11, ..    // Gravity constant in m³/(kg*s²) or in Nm²/kg²
        "c", 299792458, ..      // lightspeed in vacuum in m/s
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
    moon = struct( .. 
        "mass",7.342e22, ..      // Mass in kg
        "vol", 2.1958e19, ..     // Volume in m**3
        "r", 1738e3 , ..         // Mean radius in m
        "r_eq", 1738.1e3, ..     // Equatorial radius in m
        "r_pol", 1736.0e3, ..    // Polar radius in m
        "g", 1.62 , ..           // Mean gravity in m/s**2
        "p", 0.3e-11 , ..        // Surface pressure ("sea level") in hPa
        "p_d", 1e-9 , ..         // Surface pressure at daytime in hPa
        "p_n", 1e-12 , ..        // Surface pressure at night in hPa
        "rho", 3344, ..          // Mean density in kg/m**3
        "area", 37932330e6, ..   // Surface area in m**2
        "aph", 405400e3, ..      // Aphelion in m
        "per", 362600e3, ..      // Pherihelion in m 
        "period_synod", 2551442.9, .. // Synodic period in s
        "period_orbit", 2360587.1, .. // Orbital period in s
        "", 0 .. 
    );
    
    L0 = setdiff(who("local"), L0)
    execstr("["+strcat(L0,",")+"] = resume("+strcat(L0,",")+")")    
endfunction
