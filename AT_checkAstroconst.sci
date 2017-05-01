function AT_checkAstroconst()
    //
    // Checks if AT_astroconst() was executed to provide constants 
    //
    // CALLING SEQUENCES
    // AT_checkAstroconst()
    //
    // PARAMETERS
    // none
    //
    // DESCRIPTION
    // Check if AT_astroconst() was executed and constants loaded. If not a 
    // error message is displayed and terminates the script or function.
    //
    if ~exists("AT_astroconst_loaded") then 
        error("AT_astroconst() was not executed. Type AT_astroconst() for loading constants into Scilab before you use this function");
    end
endfunction
