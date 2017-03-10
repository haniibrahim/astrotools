// Convert current day of the year to month and day
//
// The current day starts with 0 
// => Jan., 1st = 0; Dec., 31st = 364 (normal year), 365 (leap year)
//
// cday: current day of the year (1 .. 365)
// year: year as 4-digit number (e.g. 2016)
//
// month: month as a number (1 .. 12)
// day  : day as a number (1 .. 31)

function [month, day] = AT_currentday2date(cday, year)
  // Check committed argument
  inarg = argn(2);
  if inarg > 2 | inarg < 2 then error("Wrong amount of parameters"); end
    
  datenum0 = cday + datenum(year, 1, 1) - 1;
  dateVector = datevec(datenum0);
  month = dateVector(:,2);
  day = dateVector(:,3);

endfunction
