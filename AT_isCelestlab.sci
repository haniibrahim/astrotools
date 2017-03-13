function celestlab = AT_isCelestlab()
//
// Checks if CelestLab toolbox is installed and loaded
//
// CALLING SEQUENCES
// celestlab = AT_isCelestlab()
//
// PARAMETERS
// celestlab: %T if CelestLab toolbox is available, %F if not
//
// DESCRIPTION
// AstroTools make sometimes use of functions from CNES' CelestLab
// toolbox. This function checks if it is installed and loaded.
//
    if exists("CL_init") then
        celestlab = %T;
    else
        celestlab = %F;
    end
endfunction
