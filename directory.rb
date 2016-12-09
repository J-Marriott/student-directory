def input_students
  @students = [] # creates empty array
  puts "Welcome to the student directory".center(80)
  puts
  puts "Please enter the name of the student you are adding ".center(80)
  puts "....".center(80, '...')
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do

      studentcohort = ""
      while studentcohort.empty? do
        puts "Please enter the cohort of the student".center(80)
        puts "e.g. January/April/July/November".center(80)
        studentcohortcheck = gets.chomp.downcase.to_sym
        if studentcohortcheck == :january
          studentcohort = :january
        elsif studentcohortcheck == :april
          studentcohort = :april
        elsif studentcohortcheck == :july
          studentcohort = :july
        elsif studentcohortcheck == :november
          studentcohort = :november
        else
          puts "Did you spell the month correctly?".center(80)
          spellcheck = gets.chomp.downcase
          if spellcheck == "yes"
            studentcohort = :no_valid_cohort
          end
        end
      end

      #studentcohort = :no_input if studentcohort.empty?

      puts "Please enter the country of birth of the student".center(80)
      puts
      studentcountry = gets.chomp

      puts "Please enter the height of the student in cm".center(80)
      puts
      studentheight = gets.chomp

      puts "Please enter a hobby of the student".center(80)
      puts
      studenthobby = gets.chomp

      @students << {name: name, cohort: studentcohort, country: studentcountry, hobby: studenthobby, height: studentheight }

      puts
      if @students.count != 1
        puts "Now we have #{@students.count} students".center(80, '...')
      else
        puts "Now we have #{@students.count} student".center(80, '...')
      end

      puts
      puts "If you would like to add another student, type their name and press return,".center(80)
      puts "or just press return to continue".center(80)
      puts ".................................".center(80, '...')

      name = gets.chomp # sets name value so loop runs again from the top
  end
  #return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end
=begin
def print(students)
  totalstudents = @students.length # setting total number of loops
  counter = 0
  while counter < totalstudents # while loop to loop until all students outputted
    puts "#{counter+1}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort), Birthplace: #{@students[counter][:country]}, Height: #{@students[counter][:height]}cm, Hobby: #{@students[counter][:hobby]}.".center(80)
    counter += 1
    puts
  end
end
=end

def printcohort(students)
  @studentscohort = @students.sort_by {|student| student[:cohort]}
  totalstudents = @studentscohort.length # setting total number of loops
  counter = 0
  while counter < totalstudents # while loop to loop until all students outputted
    puts "#{counter+1}. #{@studentscohort[counter][:name]} (#{@studentscohort[counter][:cohort]} cohort), Birthplace: #{@studentscohort[counter][:country]}, Height: #{@studentscohort[counter][:height]}cm, Hobby: #{@studentscohort[counter][:hobby]}.".center(80)
    counter += 1
    puts
  end
end

def print_footer(students)
  if @students.count != 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "Overall, we have #{@students.count} great student"
  end
end


# nothing happens until we call the methods
# and then print them
students = input_students

if @students.count > 0
  print_header
  printcohort(@studentscohort)
  #print(students)
  print_footer(students)
else
  puts "No students have been added to the directory"
end
