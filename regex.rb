# Determine whether a string contains a SIN (Social Insurance Number).
# A SIN is 9 digits and we are assuming that they must have dashes in them
def has_sin?(string)
	if /(\s\d{3}-\d{3}-\d{3})$/.match(string)
		return true
	else
		return false
	end
end
 
puts "has_sin? returns true if it has what looks like a SIN"
puts has_sin?("please don't share this: 234-604-142") #== true
 
puts "has_sin? returns false if it doesn't have a SIN"
puts has_sin?("please confirm your identity: XXX-XXX-142") #== false
puts has_sin?("please don't share this: 234-6043-142") #== false
puts has_sin?("please don't share this: 2342-604-142") #== false
puts has_sin?("please don't share this: 234-604-1421") #== false

# Return the Social Insurance Number from a string.
def grab_sin(string)
	array = string.scan(/(\d{3}-\d{3}-\d{3})/)
  test = array.join()
  if test != ""
  	return test
  else
  	return nil
  end

end
 
 
puts "grab_sin returns an SIN if the string has an SIN"
puts grab_sin("please don't share this: 234-604-142") #== "234-604-142"
 
puts "grab_sin returns nil if it doesn't have a SIN"
puts grab_sin("please confirm your identity: XXX-XXX-142") #== nil


# Return all of the SINs from a string, not just one.
def grab_all_sins(string)
  array = string.scan(/(\d{3}-\d{3}-\d{3})/)
  array2 = []
  
  array2 = array.flatten
  
  return array2

end
 
puts "grab_all_sins returns all SINs if the string has any SINs"
puts grab_all_sins("234-604-142, 350-802-074, 013-630-876") #== ["234-604-142", "350-802-074", "013-630-876"]
 
#puts "grab_all_sins returns an empty Array if it doesn't have any SINs"
puts grab_all_sins("please confirm your identity: XXX-XXX-142") #== []



# Obfuscate all of the Social Insurance numbers in a string. Example: XXX-XX-4430.
def hide_all_sins(string)

	string2 = ""

	if /(\s\d{3}-\d{3}-\d{3})$/.match(string)
		string2 = string.gsub(/(\d{3}-)/, 'XXX-')
		return string2
	else
		return string
	end

end
 
puts "hide_all_sins obfuscates any SINs in the string"
puts hide_all_sins("234-601-142, 350-801-074, 013-601-876") == "XXX-XXX-142, XXX-XXX-074, XXX-XXX-876"
 
puts "hide_all_sins does not alter a string without SINs in it"
string = "please confirm your identity: XXX-XXX-142"
puts hide_all_sins(string) == string

 
# Ensure all of the Social Insurance numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_sins(string)
	string.gsub(/(\d{3}).?(\d{3}).?(\d{3})/, '\1-\2-\3')
end
 
puts "format_sins finds and reformat any SINs in the string"
puts format_sins("234600142, 350.800.074, 013-600-876") == "234-600-142, 350-800-074, 013-600-876"
 
puts "format_sins does not alter a string without SINs in it"
string = "please confirm your identity: 4421422"
puts format_sins(string) == string
 
string = "please confirm your identity: 123abc445"
puts format_sins(string) == string
