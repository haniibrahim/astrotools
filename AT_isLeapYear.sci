function [leapYear] = AT_isLeapYear(year)
    //
    // Calculates whether the committed year is a leap year or not.
    //
    // CALLING SEQUENCES
    // leapYear = AT_isLeapYear(year)
    //
    // PARAMETERS
    // year:      four-digit number of the year in question.
    // leapYear : boolean which is %T if "year" is a leap year 
    //            and %F if not.
    //
    // DESCRIPTION
    // Calculates whether the committed year is a leap year or not. 
    // Result is a boolean
    // 

    // Check committed argument
    inarg = argn(2);
    if inarg > 1 | inarg < 1 then error("Wrong amount of parameters"); end

    // Leap year
    // - Every 4th year is a leap year
    // - But every 100th year is not a leap year
    // - But every 400th year is a leap year  
    fourth        = pmodulo(year,4);
    hundredth     = pmodulo(year,100);
    fourhundredth = pmodulo(year, 400);

    if ( fourth == 0 & hundredth ~= 0 | fourhundredth == 0 )
        leapYear = %T;
    else
        leapYear = %F;
    end  
endfunction
