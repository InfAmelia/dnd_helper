module PagesHelper
   def calculate_css(xp_object)
       ratio = xp_object.xp_min / max_xp(xp_object.level)

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
         50000
       elsif level > 17
         40000
       elsif level > 16
         40000
       elsif level > 15
         30000
       elsif level > 14
         30000
       elsif level > 13
         25000
       elsif level > 12
         20000
       elsif level > 11
         20000
       elsif level > 10
         15000
       elsif level > 9
         21000
       elsif level > 8
         16000
       elsif level > 7
         14000
       elsif level > 6
         11000
       elsif level > 5
         9000
       elsif level > 4
         7500
       elsif level > 3
         3800
       elsif level > 2
         1800
       elsif level > 1
         600
       else
         300
       end

       max
     end
end
