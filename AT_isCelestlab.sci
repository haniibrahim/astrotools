// Checks if CelestLab toolbox is installed and loaded

function celestlab = AT_isCelestlab()
    if exists("CL_init") then
        celestlab = %T;
    else
        celestlab = %F;
    end
endfunction
