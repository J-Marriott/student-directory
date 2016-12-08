def input_students
  students = [] # creates empty array
  puts "Please enter the name of the student you are adding to the directory"
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do

      puts "Please enter the country of birth of the student"
      studentcountry = gets.chomp

      puts "Please enter the height of the student in cm"
      studentheight = gets.chomp

      puts "Please enter a hobby of the student"
      studenthobby = gets.chomp

      students << {name: name, cohort: :november, country: studentcountry, hobby: studenthobby, height: studentheight }

      puts "Now we have #{students.count} students"
      puts "If you would like to add another student, type their name and press return, or just press return to continue"

      name = gets.chomp # sets name value so loop runs again from the top
  end



  #return the array of students
  students


end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  totalstudents = students.length # setting total number of loops
  counter = 0
  while counter < totalstudents # while loop to loop until all students outputted
    puts "#{counter+1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort), Birthplace: #{students[counter][:country]}, Height: #{students[counter][:height]}cm, Hobby: #{students[counter][:hobby]}."
    counter += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


# nothing happens until we call the methods
# and then print them
students = input_students
print_header
print(students)
print_footer(students)
