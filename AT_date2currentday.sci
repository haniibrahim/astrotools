// Convert date to current day of the year
//
// The current day starts with 1 
// => Jan., 1st = 1; Dec., 31st = 365 (normal year), 366 (leap year)
//
// year: year as 4-digit number (e.g. 2016)
// month: month as a number (1 .. 12)
// day  : day as a number (1 .. 31)
//
// cday: current day of the year (1 .. 365, 366 when leap year)

function [cday] = AT_date2currentday(year, month, day)
  // Check committed argument
  inarg = argn(2);
  if inarg > 3 | inarg < 3 then error("Wrong amount of parameters"); end
    
  cday = datenum(year, month, day) - datenum(year, 1, 1) + 1;
  
endfunction
