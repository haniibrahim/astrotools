function [month, day, h, m, s] = AT_currentday2date(cday, year)
    //
    // Convert current day of the year to month and day
    //
    // CALLING SEQUENCES
    // [month, day, h, m, s] = AT_currentday2date(cday, year)
    // [month, day] = AT_currentday2date(cday, year)
    //
    // PARAMETERS
    // cday:  current day of the year (1 .. 365, 366 when leap year)
    // year:  year as 4-digit number (e.g. 2016)
    // month: month as a number (1 .. 12)
    // day:   day as a number (1 .. 31)
    // m:     minute (0..59)
    // s:     second (0..59)
    //
    // DESCRIPTION
    // The current day starts with 1
    // => Jan., 1st = 1, Dec., 31st = 365 (normal year), 366 (leap year)
    //
    
    // Check committed argument
    inarg = argn(2);
    if inarg > 2 | inarg < 2 then error("Wrong amount of parameters"); end

    datenum0 = cday + datenum(year, 1, 1) - 1;
    dateVector = datevec(datenum0);
    if cday < 1 then // to convert current day differences less than an day
        month = 0;
        day = 0;
    else
        month = dateVector(:,2);
        day = dateVector(:,3);
    end
    h =dateVector(:,4);
    m =dateVector(:,5);
    s =dateVector(:,6);

endfunction
