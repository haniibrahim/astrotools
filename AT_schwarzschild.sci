function [sr] = AT_schwarzschild(m)
    //
    // Calculates the Schwarzschild radius of non-rotating objects
    //
    // CALLING SEQUENCES
    // [sr] = AT_schwarzschild(m)
    //
    // PARAMETERS
    // m:  Mass of the object in kg
    // sr: Schwarzschild radius of the object
    //
    // DESCRIPTION
    // Calculates the radius to which an object has to be comprimised
    // that the escape speed is light speed (black holes). 
    // THIS FUNCTION IS VAILD FOR NON-ROTATION OBJECTS ONLY!
    // This is equal to the event horizon in this case.
    //
    // EXAMPLES
    // sr = AT_schwarzschild(%sun.mass) // Schwarzschild radius of the sun
    // 

    inarg = argn(2); // number of parameters/arguments
    if inarg < 1 | inarg > 1 then error(39); end
    
    sr = 2 .* %gen.G * m ./ %gen.c**2;
      

endfunction
