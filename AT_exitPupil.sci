// Exit pupil of an eye piece
//
// lens_dia    = lens diameter in m(mm)
// lens_foclen = lens focal length in m(mm)
// ep_foclen   = eye piece focal length in m(mm) 
//
// exitPupil   = exit pupil of the eye piece in question m(mm)

function [ep] = AT_exitPupil(lens_dia, lens_foclen, ep_foclen)
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error("Wrong amount of parameters"); end
    acc = lens_foclen ./ ep_foclen;
    exitPupil = lens_dia ./ acc;
endfunction
