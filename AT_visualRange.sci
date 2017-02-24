// Visual range w/ or w/o terrestrial refraction
// Src: https://rechneronline.de/sehwinkel/sichtweite.php and
// https://de.wikipedia.org/wiki/Sichtweite
// 
// height1 = height of eye/instrument in m
// height2 = height of distant object in m
// refr    = terrestrial refraction (OPTIONAL)
//           set to 1 (no refraction) if not committed, 
//           refr = 1.08 is common value.
// (height1 and height2 are interchangable)
//
// range = visual range of sight in m

function [range] = AT_visualRange(height1, height2, refr)
    inarg = argn(2);
    if inarg > 3 | inarg < 2 then error("Wrong amount of parameters"); end
    if inarg == 2 then
        refr = 1; // No terrestrial refraction
    end
    
    if ~exists("AT_astroconst_loaded") then 
        warning("off")
        exec("./AT_astroconst.sci",-1); 
        warning("on")
        AT_astroconst();
    end
// Simplified form for low heights
//    f = sqrt(2 * earth.r) * refr;
//    range = f*(sqrt(height1) + sqrt(height2));
    
    range = (sqrt(2 .* earth.r .* height1 + height1**2) + sqrt(2 .* earth.r .* height2 + height2**2)) * refr;
    
endfunction
