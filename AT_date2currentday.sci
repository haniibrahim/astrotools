function [cday] = AT_date2currentday(year, month, day, h, m, s)
// Convert date to current day of the year
//
// CALLING SEQUENCES
// cday = AT_date2currentday(year, month, day, h, m, s)
// cday = AT_date2currentday(year, month, day)
//
// PARAMETERS
// year:  year as 4-digit number (e.g. 2016)
// month: month as a number (1 .. 12)
// day:   day as a number (1 .. 31)
// h:     hour (0..23)
// m:     minute (0..59)
// s:     second (0..59)
// cday: current day of the year (1 .. 365, 366 when leap year)
//
// DESCRIPTION
// The current day starts with 1 
// => Jan., 1st = 1; Dec., 31st = 365 (normal year), 366 (leap year)
//

  // Check committed argument
  inarg = argn(2);
  if inarg > 6 | inarg < 3 then error("Wrong amount of parameters"); end
  if inarg == 3 then
      h = 0;
      m = 0;
      s = 0;
  end
    
  cday = datenum(year, month, day, h, m, s) - datenum(year, 1, 1) + 1;
  
endfunction
