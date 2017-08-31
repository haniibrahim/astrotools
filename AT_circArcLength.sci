function [arclen] = AT_circArcLength(tanLen, r)
    //
    // Calculates the circular arc length of an appropriate tangent
    //
    // CALLING SEQUENCES
    // [arclen] = AT_circArcLength(tanLen, r)
    // [arclen] = AT_circArcLength(tanLen)
    //
    // PARAMETERS
    // tanLen:   Length of the tangent in m
    // r:        Radius of the sphere in m (OPTIONAL)
    //           If not committed r:=earth's mean radius
    // arcLen:   Length of the cirular arc "under" the tangent
    //
    // DESCRIPTION
    // Calculate the length of the circular arc "under" a tangent.
    //
    // Its main purpose is to determine the difference of a distance
    // on a plane in comparison to a sphere (earth). Means, a 1000m
    // straight distance on a plane is eqzual to 999.99999m on a sphere
    // (circular arc)
    //
    // EXAMPLES
    // [arclen] = AT_circArcLength(10000)
    // [arclen] = AT_circArcLength(10000, %moon.r)
    // 

    inarg = argn(2); // number of parameters/arguments
    if inarg < 1 | inarg >2 then error(39); end
    if inarg == 1 then
        r = %earth.r;
    end
    
    // Alpha angle of the right triangle which is spanned via center 
    // of the sphere and the tangent
    h=AT_curveHeight(0,tanLen,,r);
    alpha = asin(tanLen ./ (r+h));
    
    // Length of the chord of the 2nd isosceles triangle w/ chord as  
    // the non-isoceles side of the triangle
    s = 2 .* r .* sin(alpha/2);
    
    // circular arc via 2nd isosceles triangle w/ chord as the 
    // non-isoceles side of the triangle
    arclen = r .* alpha; // length of the circular arc
    return;
endfunction
