module PagesHelper
   def calculate_css(party)
       ratio = party.current_xp / max_xp(party.current_level)

       severity = if ratio > 0.9
           "green-text text-accent-3"
         elsif ratio > 0.7
           "green-text text-darken-1"
         elsif ratio > 0.5
           "green-text text-lighten-3"
         elsif ratio > 0.4
           "green-text text-darken-3"
         elsif ratio > 0.3
           "indigo-text text-accent-3"
         elsif ratio > 0.2
           "indigo-text text-lighten-1"
         elsif ratio > 0.1
           "indigo-text text-lighten-2"
         else
           "indigo-text text-lighten-3"
       end

       severity
     end

     def max_xp(level)
       max = if level > 18
         355000
       elsif level > 17
         305000
       elsif level > 16
         265000
       elsif level > 15
         225000
       elsif level > 14
         195000
       elsif level > 13
         165000
       elsif level > 12
         140000
       elsif level > 11
         120000
       elsif level > 10
         100000
       elsif level > 9
         85000
       elsif level > 8
         64000
       elsif level > 7
         48000
       elsif level > 6
         34000
       elsif level > 5
         23000
       elsif level > 4
         14000
       elsif level > 3
         6500
       elsif level > 2
         2700
       elsif level > 1
         900
       else
         300
       end

       max
     end
end
