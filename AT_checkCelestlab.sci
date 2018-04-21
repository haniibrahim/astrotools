function AT_checkCelestlab()
    //
    // Checks if Toolbox Celestlab is installed and loaded 
    //
    // CALLING SEQUENCES
    // AT_checkCelestlab()
    //
    // PARAMETERS
    // none
    //
    // DESCRIPTION
    // Check if Toolbox Celestlab was loaded. If not a 
    // error message is displayed and terminates the script or function.
    //
    if ~AT_isCelestlab() then 
        error("Celestlab toolbox is not present. Type: atomInstall(""celestlab"") while connected to the internet");
    end
endfunction
