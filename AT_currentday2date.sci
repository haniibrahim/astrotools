// Convert current day of the year to month and day
//
// The current day starts with 1 
// => Jan., 1st = 1 Dec., 31st = 365 (normal year), 366 (leap year)
//
// cday: current day of the year (1 .. 365, 366 when leap year)
// year: year as 4-digit number (e.g. 2016)
//
// month: month as a number (1 .. 12)
// day  : day as a number (1 .. 31)
// m: minute (0..59)
// s: second (0..59)

function [month, day, h, m, s] = AT_currentday2date(cday, year)
  // Check committed argument
  inarg = argn(2);
  if inarg > 2 | inarg < 2 then error("Wrong amount of parameters"); end
    
  datenum0 = cday + datenum(year, 1, 1) - 1;
  dateVector = datevec(datenum0);
  month = dateVector(:,2);
  day = dateVector(:,3);
  h =dateVector(:,4);
  m =dateVector(:,5);
  s =dateVector(:,6);

endfunction
