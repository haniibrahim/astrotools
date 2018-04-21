function AT_astroconst(silence)
    //
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
    "obla", CL_dataGet("body.Sun.obla"), .. // Oblateness
    "g", 274, ..            // Mean gravity on surface in m/s^2
    "rho", 1408, ..         // Mean density in kg/m^3
    "", 0 ..
    );

    // Earth constants
    %earth = struct( .. 
    "mass", 5.97237e24, ..  // Mass in kg
    "vol", 1.08321e15, ..   // Volume in m^3
    "r", 6.371e6, ..        // Mean radius in m
    "r_eq", CL_dataGet("eqRad"), .. // Equatorial radius in m (EGM96s gravity model)
    "r_pol", 6.3568e6, ..   // Polar radius in m
    "obla", CL_dataGet("obla"), .. // oblateness (WGS84 ellipsoid)
    "g", CL_dataGet("g0"), ..  // Mean gravity in m/s^2
    "p", 1013.25, ..        // Surface pressure ("sea level") in hPa
    "rho", 5514, ..         // Mean density in kg/m^3
    "area", 5.10072e11, ..  // Surface area in m^2
    "area_lnd",1.48940e11,.. // Surface area land in m^2
    "area_h2o",3.61132e11,.. // Surface area water in m^2
    "aph", 1.52100e11, ..    // Aphelion in m
    "per", 1.47095e11, ..    // Perihelion in m 
    "dist", CL_dataGet("au"), ..  // Mean distance from the sun in m
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
    "p", 0.3e-11 , ..        // Surface pressure ("sea level") in hPa
    "p_d", 1e-9 , ..         // Surface pressure at daytime in hPa
    "p_n", 1e-12 , ..        // Surface pressure at night in hPa
    "rho", 3344, ..          // Mean density in kg/m^3
    "area", 37932330e6, ..   // Surface area in m^2
    "dist", 384.4e6, ..      // Distance (Semi-major axis)
    "aph", 405.5e6, ..       // Aphelion in m
    "per", 363.3e6, ..       // Perihelion in m 
    "period_synod", 2551442.9, .. // Synodic period in s
    "period_orbit", 2360587.1, .. // Orbital period in s
    "", 0 .. 
    );
    //General constants
    %gen = struct( ..
    "G", CL_dataGet("gravCst"), .. // Gravity constant in m^3/(kg * s^2) or in Nm^2/kg^2
    "c", CL_dataGet("lightSpeed"), .. // speed of light in vacuum in m/s
    "AE", %earth.dist, ..    // Astronomic unit
    "R", 8.3144598, ..      // Universal gas constant in J/(mol*K)
    "R_air", 287.0578987, ..// Special gas constant for dry air in J/(kg*K)
    "", 0 ..
    );
    
    L0 = setdiff(who("local"), L0)
    execstr("["+strcat(L0,",")+"] = resume("+strcat(L0,",")+")")    
endfunction
