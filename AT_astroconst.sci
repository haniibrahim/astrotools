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
    "mass", 5.97220e+24, .. // Mass (kg)
    "vol",1.08321e+11, .. // Volume (m**3)
    "r", 6.3710000e+06, .. // Mean radius (m)
    "r_eq", 6.3781370e+06, .. // Equatorial radius (m)
    "r_pol", 6.3567520e+06, .. // Polar radius (m)
    "obla", 0.003353, .. // Ellipticity (Flattening)
    "g", 9.798, .. // Surface gravity (eq.) (m/s2)
    "gs", 9.780, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 11186.00, .. // Escape velocity (m/s)
    "p", 1.014e+05, .. // Surface pressure (Pa)
    "rho", 5513.0, .. // Mean density (kg/m3)
    "o_aph", 1.52100e+11, .. // Aphelion (m)
    "o_per", 1.47095e+11, .. // Perihelion (m)
    "o_dist", 1.49598e+11, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 8766.14, .. // Sidereal orbit period (h)- siderisch (fixed star)
    "o_period_tro", 365.24, .. // Tropical orbit period (h) - synodisch (Opposition/Elongation)
    "o_v", 29780, .. // Mean orbital velocity (m/s)
    "o_v_max", 30290, .. // Max. orbital velocity (m/s)
    "o_v_min", 29290, .. // Min. orbital velocity (m/s)
    "o_inc", 0.00000010, .. // Orbit inclination (rad)
    "o_ecc", 0.016700, .. // Orbit eccentricity
    "o_day_sid", 23.9345*3600, .. // Sidereal rotation period (s)
    "o_day_sol", 24.0000*3600, .. // Length of day (s)
    "o_obliq", 0.4091051767, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    // Moon constants
//    %moon = struct( .. 
//    "mass",7.342e22, ..      // Mass in kg
//    "vol", 2.1958e19, ..     // Volume in m^3
//    "r", 1738e3 , ..         // Mean radius in m 
//    "r_eq", 1738.1e3, ..     // Equatorial radius in m
//    "r_pol", 1736.0e3, ..    // Polar radius in m
//    "g", 1.62 , ..           // Mean gravity in m/s^2
//    "p", 0.3e-9 , ..         // Surface pressure ("sea level") in Pa
//    "p_d", 1e-7 , ..         // Surface pressure at daytime in Pa
//    "p_n", 1e-10 , ..        // Surface pressure at night in Pa
//    "rho", 3344, ..          // Mean density in kg/m^3
//    "area", 37932330e6, ..   // Surface area in m^2
//    "dist", 384.4e6, ..      // Distance (Semi-major axis)
//    "aph", 405.5e6, ..       // Aphelion in m
//    "per", 363.3e6, ..       // Perihelion in m 
//    "period_synod", 2551442.9, .. // Synodic period in s
//    "period_orbit", 2360587.1, .. // Orbital period in s
//    "", 0 .. 
//    );
    %moon = struct( .. 
    "mass", 7.34600e+22, .. // Mass (kg)
    "vol",2.19680e+09, .. // Volume (m**3)
    "r", 1.7374000e+06, .. // Mean radius (m)
    "r_eq", 1.7381000e+06, .. // Equatorial radius (m)
    "r_pol", 1.7360000e+06, .. // Polar radius (m)
    "obla", 0.001200, .. // Ellipticity (Flattening)
    "g", 1.620, .. // Surface gravity (eq.) (m/s2)
    "gs", 1.620, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 2380.00, .. // Escape velocity (m/s)
    "p", 3.000e-10, .. // Surface pressure (Pa)
    "rho", 3344.0, .. // Mean density (kg/m3)
    "o_aph", 4.05500e+08, .. // Aphelion (m)
    "o_per", 3.63300e+08, .. // Perihelion (m)
    "o_dist", 3.84400e+08, .. // Semimajor axis - mean distance from sun (m)
    "o_v", 1022, .. // Mean orbital velocity (m/s)
    "o_v_max", 1082, .. // Max. orbital velocity (m/s)
    "o_v_min", 970, .. // Min. orbital velocity (m/s)
    "o_inc", 0.08979710, .. // Orbit inclination (rad)
    "o_ecc", 0.054900, .. // Orbit eccentricity
    "o_day_sid", 655.7200*3600, .. // Sidereal rotation period (s)
    "o_day_sol", 708.7200*3600, .. // Length of day (s)
    "o_obliq", 11.4444729712, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    // Mercury constants
    %mercury = struct( .. 
    "mass", 3.30100e+23, .. // Mass (kg)
    "vol",6.08300e+09, .. // Volume (m**3)
    "r", 2.4397000e+06, .. // Mean radius (m)
    "r_eq", 2.4405000e+06, .. // Equatorial radius (m)
    "r_pol", 2.4383000e+06, .. // Polar radius (m)
    "obla", 0.000900, .. // Ellipticity (Flattening)
    "g", 3.700, .. // Surface gravity (eq.) (m/s2)
    "gs", 3.700, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 4300.00, .. // Escape velocity (m/s)
    "p", 5.000e-10, .. // Surface pressure (Pa)
    "rho", 5429.0, .. // Mean density (kg/m3)
    "o_aph", 6.98180e+10, .. // Aphelion (m)
    "o_per", 4.60000e+10, .. // Perihelion (m)
    "o_dist", 5.79090e+10, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 2111.26, .. // Sidereal orbit period (h)- siderisch (fixed star)
    "o_period_tro", 87.97, .. // Tropical orbit period (h) - synodisch (Opposition/Elongation)
    "o_v", 47360, .. // Mean orbital velocity (m/s)
    "o_v_max", 58980, .. // Max. orbital velocity (m/s)
    "o_v_min", 38860, .. // Min. orbital velocity (m/s)
    "o_inc", 0.12224310, .. // Orbit inclination (rad)
    "o_ecc", 0.205600, .. // Orbit eccentricity
    "o_day_sid", 1407.6000*3600, .. // Sidereal rotation period (s)
    "o_day_sol", 4222.6000*3600, .. // Length of day (s)
    "o_obliq", 0.0005934119, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    // Venus constants
    %venus = struct( .. 
    "mass", 4.86730e+24, .. // Mass (kg)
    "vol",9.28430e+10, .. // Volume (m**3)
    "r", 6.0518000e+06, .. // Mean radius (m)
    "r_eq", 6.0518000e+06, .. // Equatorial radius (m)
    "r_pol", 6.0518000e+06, .. // Polar radius (m)
    "obla", 0.000000, .. // Ellipticity (Flattening)
    "g", 8.870, .. // Surface gravity (eq.) (m/s2)
    "gs", 8.870, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 10360.00, .. // Escape velocity (m/s)
    "p", 9.200e+06, .. // Surface pressure (Pa)
    "rho", 5243.0, .. // Mean density (kg/m3)
    "o_aph", 1.08941e+11, .. // Aphelion (m)
    "o_per", 1.07480e+11, .. // Perihelion (m)
    "o_dist", 1.08210e+11, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 5392.82, .. // Sidereal orbit period (h)- siderisch (fixed star)
    "o_period_tro", 224.69, .. // Tropical orbit period (h) - synodisch (Opposition/Elongation)
    "o_v", 35020, .. // Mean orbital velocity (m/s)
    "o_v_max", 35260, .. // Max. orbital velocity (m/s)
    "o_v_min", 34790, .. // Min. orbital velocity (m/s)
    "o_inc", 0.05925410, .. // Orbit inclination (rad)
    "o_ecc", 0.006800, .. // Orbit eccentricity
    "o_day_sid", -5832.6000*3600, .. // Sidereal rotation period (s)
    "o_day_sol", 2802.0000*3600, .. // Length of day (s)
    "o_obliq", 3.0955159613, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    %mars = struct( .. 
    "mass", 6.41690e+23, .. // Mass (kg)
    "vol",1.63180e+10, .. // Volume (m**3)
    "r", 3.3895000e+06, .. // Mean radius (m)
    "r_eq", 3.3962000e+06, .. // Equatorial radius (m)
    "r_pol", 3.3762000e+06, .. // Polar radius (m)
    "obla", 0.005890, .. // Ellipticity (Flattening)
    "g", 3.710, .. // Surface gravity (eq.) (m/s2)
    "gs", 3.690, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 5030.00, .. // Escape velocity (m/s)
    "p", 6.360e+02, .. // Surface pressure (Pa)
    "rho", 3934.0, .. // Mean density (kg/m3)
    "o_aph", 2.49261e+11, .. // Aphelion (m)
    "o_per", 2.06650e+11, .. // Perihelion (m)
    "o_dist", 2.27956e+11, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 59355072, .. // Sidereal orbit period (s)- siderisch (fixed star)
    "o_period_tro", 59354467, .. // Tropical orbit period (s) - synodisch (Opposition/Elongation)
    "o_v", 24070, .. // Mean orbital velocity (m/s)
    "o_v_max", 26500, .. // Max. orbital velocity (m/s)
    "o_v_min", 21970, .. // Min. orbital velocity (m/s)
    "o_inc", 0.03225410, .. // Orbit inclination (rad)
    "o_ecc", 0.093500, .. // Orbit eccentricity
    "o_day_sid", 88642, .. // Sidereal rotation period (s)
    "o_day_sol", 88775, .. // Length of day (s)
    "o_obliq", 0.4396484386, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    // Jupiter constants
    %jupiter = struct( .. 
    "mass", 1.89813e+27, .. // Mass (kg)
    "vol",1.43128e+14, .. // Volume (m**3)
    "r", 6.9911000e+07, .. // Mean radius (m)
    "r_eq", 7.1492000e+07, .. // Equatorial radius (m)
    "r_pol", 6.6854000e+07, .. // Polar radius (m)
    "obla", 0.064870, .. // Ellipticity (Flattening)
    "g", 24.790, .. // Surface gravity (eq.) (m/s2)
    "gs", 23.120, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 59500.00, .. // Escape velocity (m/s)
    "rho", 1326.0, .. // Mean density (kg/m3)
    "o_aph", 8.16363e+11, .. // Aphelion (m)
    "o_per", 7.40595e+11, .. // Perihelion (m)
    "o_dist", 7.78479e+11, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 374335690, .. // Sidereal orbit period (s)- siderisch (fixed star)
    "o_period_tro", 374163408, .. // Tropical orbit period (s) - synodisch (Opposition/Elongation)
    "o_v", 13060, .. // Mean orbital velocity (m/s)
    "o_v_max", 13720, .. // Max. orbital velocity (m/s)
    "o_v_min", 12440, .. // Min. orbital velocity (m/s)
    "o_inc", 0.02275910, .. // Orbit inclination (rad)
    "o_ecc", 0.048700, .. // Orbit eccentricity
    "o_day_sid", 35730, .. // Sidereal rotation period (s)System III (1965.0) coordinatess 
    "o_day_sol", 35733, .. // Length of day (s)
    "o_obliq", 0.0546288056, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    // Saturn constants
    %saturn = struct( .. 
    "mass", 5.68320e+26, .. // Mass (kg)
    "vol",8.27130e+13, .. // Volume (m**3)
    "r", 5.8232000e+07, .. // Mean radius (m)
    "r_eq", 6.0268000e+07, .. // Equatorial radius (m)
    "r_pol", 5.4364000e+07, .. // Polar radius (m)
    "obla", 0.097960, .. // Ellipticity (Flattening)
    "g", 10.440, .. // Surface gravity (eq.) (m/s2)
    "gs", 8.960, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 35500.00, .. // Escape velocity (m/s)
    "rho", 687.0, .. // Mean density (kg/m3)
    "o_aph", 1.50653e+12, .. // Aphelion (m)
    "o_per", 1.35755e+12, .. // Perihelion (m)
    "o_dist", 1.43204e+12, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 929596608, .. // Sidereal orbit period (s)- siderisch (fixed star)
    "o_period_tro", 928535616, .. // Tropical orbit period (s) - synodisch (Opposition/Elongation)
    "o_v", 378090, .. // Mean orbital velocity (m/s)
    "o_v_max", 9680, .. // Max. orbital velocity (m/s)
    "o_v_min", 10180, .. // Min. orbital velocity (m/s)
    "o_inc", 0.15865010, .. // Orbit inclination (rad)
    "o_ecc", 0.052000, .. // Orbit eccentricity
    "o_day_sid", 38362, .. // Sidereal rotation period (s) Saturnian System III coordinates 
    "o_day_sol", 38362, .. // Length of day (s)
    "o_obliq", 0.4665265091, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    // Uranus constants
    %uranus = struct( .. 
    "mass", 8.68110e+25, .. // Mass (kg)
    "vol",6.83300e+12, .. // Volume (m**3)
    "r", 2.5362000e+07, .. // Mean radius (m)
    "r_eq", 2.5559000e+07, .. // Equatorial radius (m)
    "r_pol", 2.4973000e+07, .. // Polar radius (m)
    "obla", 0.022930, .. // Ellipticity (Flattening)
    "g", 8.870, .. // Surface gravity (eq.) (m/s2)
    "gs", 8.690, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 21300.00, .. // Escape velocity (m/s)
    "rho", 1270.0, .. // Mean density (kg/m3)
    "o_aph", 3.00139e+12, .. // Aphelion (m)
    "o_per", 2.73270e+12, .. // Perihelion (m)
    "o_dist", 2.86704e+12, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 2651218560, .. // Sidereal orbit period (s)- siderisch (fixed star)
    "o_period_tro", 2642867136, .. // Tropical orbit period (s) - synodisch (Opposition/Elongation)
    "o_v", 6800, .. // Mean orbital velocity (m/s)
    "o_v_max", 7110, .. // Max. orbital velocity (m/s)
    "o_v_min", 6490, .. // Min. orbital velocity (m/s)
    "o_inc", 0.01343910, .. // Orbit inclination (rad)
    "o_ecc", 0.046900, .. // Orbit eccentricity
    "o_day_sid", -62064, .. // Sidereal rotation period (s) Magnetic coordinates (as determined by the Voyager 2 Radio Science experiment) 
    "o_day_sol", 62064, .. // Length of day (s)
    "o_obliq", 1.7064084097, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
    
    // Neptune constants
    %neptune = struct( .. 
    "mass", 1.02409e+26, .. // Mass (kg)
    "vol",6.25400e+12, .. // Volume (m**3)
    "r", 2.4622000e+07, .. // Mean radius (m)
    "r_eq", 2.4764000e+07, .. // Equatorial radius (m)
    "r_pol", 2.4341000e+07, .. // Polar radius (m)
    "obla", 0.017080, .. // Ellipticity (Flattening)
    "g", 11.150, .. // Surface gravity (eq.) (m/s2)
    "gs", 11.000, .. // Surface acceleration (eq.) (m/s2) g-Zentrifugalforce
    "v_esc", 23500.00, .. // Escape velocity (m/s)
    "rho", 1638.0, .. // Mean density (kg/m3)
    "o_aph", 4.55886e+12, .. // Aphelion (m)
    "o_per", 4.47105e+12, .. // Perihelion (m)
    "o_dist", 4.51495e+12, .. // Semimajor axis - mean distance from sun (m)
    "o_period_sid", 5200329600, .. // Sidereal orbit period (s)- siderisch (fixed star)
    "o_period_tro", 5166711360, .. // Tropical orbit period (s) - synodisch (Opposition/Elongation)
    "o_v", 5430, .. // Mean orbital velocity (m/s)
    "o_v_max", 5500, .. // Max. orbital velocity (m/s)
    "o_v_min", 5370, .. // Min. orbital velocity (m/s)
    "o_inc", 0.03089210, .. // Orbit inclination (rad)
    "o_ecc", 0.009700, .. // Orbit eccentricity
    "o_day_sid", 57996, .. // Sidereal rotation period (s) Magnetic coordinates (as determined by the Voyager 2 Radio Science experiment) 
    "o_day_sol", 57996, .. // Length of day (s)
    "o_obliq", 0.4942772442, .. // Obliquity to orbit (rad)
    "", 0 .. 
    );
       
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
