function AT_astroconst(silence)
    // Constants for astronomic and physical calculations
    //
    // CALLING SEQUENCES
    // AT_astroconst()
    // AT_astroconst(silence)
    //
    // PARAMETERS
    // silence: if contains "yes", 1 or %T than the warning "... already loaded"
    //          will NOT appear when AT_astroconst is already loaded. If you do 
    //          not commit a parameter or commit anything else the warning  
    //          mentioned above is displayed if applicable.
    //
    // DESCRIPTION
    // Calling "AT_astroconst" will provide astronomic and physical 
    // constants as structs, e.g. mass off the earth as "%%earth.mass"
    // It makes sometimes use of Celestlab's constants. 
    //
    // [body].mass      Mass in kg
    // [body].vol       Volume in m^3
    // [body].r         Mean radius in m
    // [body].r_eq      Equatorial radius in m
    // [body].r_pol     Polar radius in m
    // [body].g         Mean gravity in m/s^2
    // [body].p         Surface pressure ("sea level") in hPa
    // [body].rho       Mean density in kg/m^3
    // [body].area      Surface area in m^2
    // [body].area_lnd  Surface area land in m^2
    // [body].area_h2o  Surface area water in m^2
    // [body].aph       Aphelion in m
    // [body].per       Perihelion in m
    // [body].xxx       more ...
    //
    // Not all constants are available for all bodies.
    //
    // EXAMPLES
    // AT_astroconst("yes")
    // AT_astroconst(1)
    // AT_astroconst(%T)
    // AT_astroconst()
    // // getting some constants
    // %earth.mass // mass of the earth in kg
    // %earth.r    // mean radius of the earth in m
    // %moon.g     // mean gravity of the moon in m/s^2
    //
    
    L0 = "";
    L0 = who("local");

    // Check if AT_astroconst() was already loaded. If so it returns immediately
    if exists("AT_astroconst_loaded") then
        if ~exists("silence","local") then silence = ""; end
        if type(silence) == 10 then silence = convstr(silence,"l"); end// make lowercase when string (type()==10)
        if silence == "yes" | silence == 1 | silence == %T then
            return;
        else
            warning("AT_astroconst() already loaded");  
            return;
        end 
    end
    
    // Check for Celestlab
    //AT_isCelestlab();
    
    AT_astroconst_loaded = 1;
    
    // sun constants
    %sun = struct (..
    "mass", 1.9884e30, ..   // Mass in kg
    "mass_diff", 2e26, ..   // fluctuating mass in kg => %sun.mass +/- %sun.mass_diff
    "vol", 1.41e27, ..      // Volume in m^3
    "r", 696342e3, ..       // Mean radius in m
    "r_eq", CL_dataGet("body.Sun.eqRad"), .. // Equatorial radius in m 
    "obla", CL_dataGet("body.Sun.obla"), .. // Oblateness
    "g", 274, ..            // Mean gravity on surface in m/s^2
    "rho", 1408, ..         // Mean density in kg/m^3
    "", 0 ..
    );

    // Earth constants
    %earth = struct( .. 
    "mass", 5.97230e+24, ..         // Mass in kg
    "vol", 1.08321e+11, ..          // Volume in m^3
    "r", 6.3710000e+06, ..          // Mean radius in m
    "r_eq", CL_dataGet("eqRad"), .. // Equatorial radius in m (EGM96s gravity model)
    "r_pol", 6.3710000e+06, ..      // Polar radius in m
    "obla", CL_dataGet("obla"), ..  // oblateness (WGS84 ellipsoid)
    "g", CL_dataGet("g0"), ..       // Mean gravity in m/s^2
    "v_esc", 11186.00, ..           // Escape velocity (m/s) 
    "p", 101400, ..                 // Surface pressure ("sea level") in Pa
    "rho", 5514, ..                 // Mean density in kg/m^3
    "area", 5.10072e11, ..          // Surface area in m^2
    "area_lnd",1.48940e11,..        // Surface area land in m^2
    "area_h2o",3.61132e11,..        // Surface area water in m^2
    "aph", 1.52100e11, ..         // Aphelion in m
    "per", 1.47090e+11, ..        // Perihelion in m 
    "dist", 1.49600e+08, ..       // Mean distance from the sun in m
    "period_sid", 8766.14, ..     // Sidereal orbit period in h (fixed stars backgroung)
    "period_tro", 365.24, ..      // Tropical orbit period in h - synodical (opposition/elongation)
    "v", 29780, ..                // Mean orbital velocity in m/s
    "v_max", 30290, ..            // Max. orbital velocity in m/s
    "v_min", 29290 , ..           // Min. orbital velocity in m/s
    "inc", 0  , ..                // Orbit inclination (rad)
    "ecc", 0.0167, ..             // Orbit eccentricity
    "day_sid", 23.9345, ..        // Sidereal rotation period in h
    "day_sol", 24.0000, ..        // Length of day in h
    "obliq", 0.4091051767, ..     // Obliquity to orbit (deg)
    "", 0 .. 
    );
    // Moon constants
    %moon = struct( .. 
    "mass",7.342e22, ..      // Mass in kg
    "vol", 2.1958e19, ..     // Volume in m^3
    "r", 1738e3 , ..         // Mean radius in m 
    "r_eq", 1738.1e3, ..     // Equatorial radius in m
    "r_pol", 1736.0e3, ..    // Polar radius in m
    "g", 1.62 , ..           // Mean gravity in m/s^2
    "p", 0.3e-9 , ..         // Surface pressure ("sea level") in Pa
    "p_d", 1e-7 , ..         // Surface pressure at daytime in Pa
    "p_n", 1e-10 , ..        // Surface pressure at night in Pa
    "rho", 3344, ..          // Mean density in kg/m^3
    "area", 37932330e6, ..   // Surface area in m^2
    "dist", 384.4e6, ..      // Distance (Semi-major axis)
    "aph", 405.5e6, ..       // Aphelion in m
    "per", 363.3e6, ..       // Perihelion in m 
    "period_synod", 2551442.9, .. // Synodic period in s
    "period_orbit", 2360587.1, .. // Orbital period in s
    "", 0 .. 
    );
    
    // Mercury constants
    %mercury = struct( .. 
    "mass", 3.301e23, ..     // Mass in kg
    "vol", 0.0608272e15, ..  // Volume in m^3
    "r", 2439700, ..         // Mean radius in m
    "r_eq", 2439700, .. // Equatorial radius in m (EGM96s gravity model)
    "r_pol", 2439700, ..   // Polar radius in m
    "obla", CL_dataGet("body.Mercury.obla"), .. // oblateness (WGS84 ellipsoid)
    "g", 3.70, ..  // Mean gravity in m/s^2
    "p", 1e-10, ..        // Surface pressure ("sea level") in Pa
    "rho", 5427, ..         // Mean density in kg/m^3
    "aph", 6.98175D+10, ..    // Aphelion in m
    "per", 4.60010D+10, ..    // Perihelion in m 
    "dist", 57909227000 , ..  // Mean distance from the sun in m
    "", 0 .. 
    );
    
//    // Venus constants
//    %venus = struct( .. 
//    "mass", 4.869e24, ..     // Mass in kg
//    "vol", 0.92840e21, ..  // Volume in m^3
//    "r", 6051800, ..         // Mean radius in m
//    "r_eq", 6051800, .. // Equatorial radius in m (EGM96s gravity model)
//    "r_pol", 6051800, ..   // Polar radius in m
//    "obla", CL_dataGet("body.Venus.obla"), .. // oblateness (WGS84 ellipsoid)
//    "g", 8.87, ..  // Mean gravity in m/s^2
//    "p", 9200000, ..        // Surface pressure ("sea level") in Pa
//    "rho", 5243, ..         // Mean density in kg/m^3
//    "aph", , ..    // Aphelion in m
//    "per", , ..    // Perihelion in m 
//    "dist",  , ..  // Mean distance from the sun in m
//    "", 0 .. 
//    );
    
    //General constants
    %gen = struct( ..
    "G", CL_dataGet("gravCst"), .. // Gravity constant in m^3/(kg * s^2) or in Nm^2/kg^2
    "c", CL_dataGet("lightSpeed"), .. // speed of light in vacuum in m/s
    "AE", CL_dataGet("au"), ..    // Astronomic unit
    "R", 8.3144598, ..      // Universal gas constant in J/(mol*K)
    "R_air", 287.0578987, ..// Special gas constant for dry air in J/(kg*K)
    "", 0 ..
    );
    
    L0 = setdiff(who("local"), L0)
    execstr("["+strcat(L0,",")+"] = resume("+strcat(L0,",")+")")    
endfunction
