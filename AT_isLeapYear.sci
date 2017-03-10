// Calculates whether the committed year is a leap year or not.
// 
// year:    is the four-digit number of the year in question.
// 
// leapYear : is a boolean which is TRUE if "year" is a leap year 
//            and FALSE if not.
// 
// Example:
//
// isleapyear(2000)
// @result{} 1
// 
// The year 2000 is a leap year.
// 
// isleapyear(1900)
// ans = 0
// The year 1900 is not a leap year.

function [leapYear] = AT_isLeapYear(year)
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
