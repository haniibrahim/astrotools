function celestlab = AT_isCelestlab(noErrMsg)
    //
    // Checks if CelestLab toolbox is installed and loaded
    //
    // CALLING SEQUENCES
    // celestlab = AT_isCelestlab()
    // celestlab = AT_isCelestlab(%T)
    //
    // PARAMETERS
    // noErrMsg:  Boolean who specifies if a error message should be displayed
    //            or not:
    //            %F or 0: error message will be displayed if necessary (standard)
    //            %T or 1: no error message, just output argument
    // celestlab: %T if CelestLab toolbox is available, %F if not
    //
    // DESCRIPTION
    // AstroTools make sometimes use of functions from CNES' CelestLab
    // toolbox. This function checks if it is installed and loaded. If
    // Celestlab is present it returns TRUE otherwise FALSE. If FALSE it
    // displays an error message. When the argument noErrMsg is specified 
    // as TRUE the error message is suppressed. 
    //
    // EXAMPLES
    // celestlab = AT_isCelestlab()
    // celestlab = AT_isCelestlab(%T)
    // celestlab = AT_isCelestlab(1)
    //
    inarg = argn(2); // number of parameters/arguments
    if inarg > 1 then error(39); end
    if inarg == 0 then noErrMsg = %F; end // If no noErrMsg committed noErrMsg = false
    
    if  atomsIsInstalled("celestlab") then
        celestlab = %T;
    elseif ~atomsIsInstalled("celestlab") & (noErrMsg == %F | noErrMsg == 0) then
        celestlab = %F;
        error(1102,"Toolbox ""CelestLab"" is not availabe. Please install ""CelestLab"" via Atoms");
    elseif ~atomsIsInstalled("celestlab") & (noErrMsg == %T | noErrMsg == 1) then
        celestlab = %F;
    else
        error(42); // Wrong input argument
    end

    //    if exists("CL_init") then
    //        celestlab = %T;
    //    else
    //        celestlab = %F;
    //    end
endfunction
