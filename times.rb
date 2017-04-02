#Hash that stores key value pairs of (city, time) for each major city
Locations = {}
hour = 60*60 #3600 seconds
#Get GMT time zone +0000
realTime = Time.now.gmtime;
#extract info with this regular expression 
# example: '2017-03-28 23:40:49 UTC' matches 2017-03-28, 23, 40
timeRegexp = /^(\S+) (\w+)\:(\w+).*$/

Locations['New York'] = realTime - (5*hour); #UTC -0500
Locations['San Francisco'] = realTime - (8*hour); 

if(realTime.month > 3 && realTime.month < 11){ #daylight savings check if april thru november
  Locations['New York'] += hour;
  Locations['San Francisco'] += hour;
}

Locations['London'] = realTime + hour;
Locations['Hong Kong'] = realTime + (8*hour);
Locations['Moscow'] = realTime + (3*hour);
Locations['Seoul'] = realTime + (9*hour);
puts
Locations.each { |k, v|
  v.to_s =~ timeRegexp  #Match regexp  $1 = date, $2 = hour, $3 = minutes
  puts k + "    Date: " + $1 + ", Time: " + $2 + ":" + $3
  puts "------------------------------------------------"
}
puts
