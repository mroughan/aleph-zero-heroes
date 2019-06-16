

working with dates
-- really nice I/O

      https://en.wikibooks.org/wiki/Introducing_Julia/Working_with_dates_and_times#Date_formatting

      https://docs.julialang.org/en/v1/stdlib/Dates/index.html
	  
	  
-- plotting with Plots

	awkward bit
	
	convert Dates to integers using Dates.value()
		integer from the "epoch"
		
	do everything in these units
	
	change the tick strings
		
	   xticks=(Dates.value.(years), datestrings)
	   
	   
