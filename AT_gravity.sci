function  [grav] = AT_gravity(m, r, h)
//
// Gravity effected on an object above a massive body
//
// CALLING SEQUENCES
// grav = AT_gravity(m, r, h)
//
// PARAMETERS
// m = Mass of the body in kg (e.g. planet)
// r = Radius of the body in m (e.g. radius of a planet)
// h = Heigth of the object above the body in m (e.g. height of an artificial satellite)
// grav = Gravity effected on the object in m/s²
//
// DESCRIPTION
// Calculates the gravity effected on an object at a particular height
// above an massive body
//
// EXAMPLES
// gravIss = AT_gravity(earth.mass, earth.r, 400000) // Gravity on ISS
//
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error("Falsche Parameteranzahl"); end
    if r == 0 | h == 0 then error("h und r dürfen nicht 0 sein!"); end

    if ~AT_isCelestlab() then
        error("Toolbox CelestLab is not installed!");
    end
    
    G = CL_dataGet("gravCst");
    grav = G .* m ./ (r+h).^2;
endfunction
