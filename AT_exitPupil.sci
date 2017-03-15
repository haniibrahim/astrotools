function [ep] = AT_exitPupil(lens_dia, lens_foclen, ep_foclen)
//
// Exit pupil of an eye piece
//
// CALLING SEQUENCES
// ep = AT_exitPupil(lens_dia, lens_foclen, ep_foclen)
//
// PARAMETERS
// lens_dia:    lens diameter of a telescope in m(mm/")
// lens_foclen: lens focal length of a telescope in m(mm/")
// ep_foclen:   eye piece focal length in m(mm/") 
// exitPupil:   exit pupil of the eye piece in question in m(mm/")
//
// DESCRIPTION
// Calculates the exit pupil of a telescope eye piece to choose the
// appropriate eye piece (focal length) with the telescope
//
    inarg = argn(2);
    if inarg > 3 | inarg < 3 then error("Wrong amount of parameters"); end
    acc = lens_foclen ./ ep_foclen;
    ep = lens_dia ./ acc;
endfunction
