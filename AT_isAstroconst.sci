function res = AT_isAstroconst(noErrMsg)
    //
    // Checks if constants from AT-astroconst() are available
    //
    // CALLING SEQUENCES
    // res = AT_isAstroconst()
    // res = AT_isAstroconst(noErrMsg)
    //
    // PARAMETERS
    // noErrMsg:  Boolean who specifies if a error message should be displayed
    //            or not:
    //            %F or 0: error message will be dispayed if neccessary (standard)
    //            %T or 1: no error message, just output argument
    // res:       %T if AT_astroconst() was called, %F if not
    //
    // DESCRIPTION
    // Checks if function AT_astroconst() was called which provide 
    // serveral natural, material and object constants, as radius of 
    // the earth etc. The constants are available as structs, e.g. 
    // %earth.r is the mean radius of the %earth.
    //
    // This function is used to check for the existance of these constants 
    // before usage.
    //
    // EXAMPLES
    // res = AT_isAstroconst()
    // res = AT_isAstroconst(%T) // suppress error message
    // res = AT_isAstroconst(1)  // suppress error message
    // 

    inarg = argn(2); // number of parameters/arguments
    if inarg > 1 then error(39); end
    if inarg == 0 then noErrMsg = %F; end
    if ~exists("AT_astroconst_loaded") & (noErrMsg == %F | noErrMsg == 0) then 
        error(1101, "AT_astrocont() not loaded! Needed constants not available. Type ""call AT_astroconst()"" for loading");
        res = %F;
    elseif ~exists("AT_astroconst_loaded") & (noErrMsg == %T | noErrMsg == 1) then
        res = %F;
    elseif exists("AT_astroconst_loaded") then
        res = %T;
    else
        error(42); // Wrong input argument
    end
endfunction
