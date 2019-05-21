
my default plotting environment in Julia

  (1) I use PlotlyJS (for interactive plots for web pages)
      and PyPlot for some of the more old-school plots
	  
  (2) I am sick of working each plot out by trial and error
  
  (3) I am sick of telling students to fix simple things about their plots
  
standard size plots
  
	  (a) assume aspect ratio (golden ratio?) and width = 1 column, a4
		  -- but I should be able to set these
	  
	  (b) assume 10 pt font in the document
		  -- font sizes in mm aren't standard, but I can choose the
	         default font and go with its size
	  
	  (c) have fontsizes calculated from all that, and set as the
	      default for a session
		  
	  (d) has settings for
	         document vs slides
				 latter needs bolder lines as well as avoids certain colours
		  

        that is, have a "method" that takes in optional parameters
		   aspect ratio, width, fontsize in final doc, particular font
        and sets up defaults
		
		
		
plot checker
    run it, and it checks a plot has
	    (1) axis labels (warnings if they are short)
		(2) a legend (if there is more than 1 line)
		(3) generates warnings if too much stuff is plotted in the
            same places (ink should be separated)
		(4) generates warnings  if there are large white spaces (not
            enough ink)	
	i.e., make a "tuft" checker
			
	
	
		
colours as well????


