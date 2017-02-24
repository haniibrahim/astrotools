// Gravity effected on an object above a massive body
//
// m = Mass of the body in kg (e.g. planet)
// r = Radius of the body in m (e.g. radius of a planet)
// h = Heigth of the object above the body in m (e.g. height of an artificial satellite)
//
// grav = Gravity effected on the object in m/s²

function  [grav] = AT_gravity(m, r, h)
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error("Falsche Parameteranzahl"); end
    if r == 0 | h == 0 then error("h und r dürfen nicht 0 sein!"); end
    // Prüfen ob "astroconst" geladen wurde, sonst laden
//    if ~exists("astroconst") then 
//        warning("off")
//        exec("./astroconst.sci",-1); 
//        warning("on")
//        astroconst();
//    end
    if ~AT_isCelestlab() then
        error("Toolbox CelestLab ist nicht installiert!");
    end
    G = CL_dataGet("gravCst");
    grav = G .* m ./ (r+h).^2;
endfunction
