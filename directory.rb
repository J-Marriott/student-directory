def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # gets the first name
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  # gets letter to display names beginning with
  puts "Enter a letter to display all students who's name begins with that letter"
  # puts "To print all students just press hit return twice"
  # get letter from user
  letter = gets.chomp.downcase
  # puts students.each_with_index {|student,index| puts "#{index}. #{student[:name]} #{student[:cohort]} cohort"}
  students_letter = [] # create new array
  students_letter = students.select{|student| student[:name][0].downcase == letter} # store students starting with letter in new array
  students_letter.each_with_index {|student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"} # iterate over array outputting values
  puts
  puts "Printing students with a name shorter than 12 characters"
  students_number = []
  students_number = students.select{|student| student[:name].length < 12}
  students_number.each_with_index {|student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"}
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
