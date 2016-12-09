@students = []
def input_students
  puts "Please enter the name of the student you are adding ".center(80)
  puts "....".center(80, '...')
  @name = STDIN.gets.chomp
  # while name is not empty, repeat this code
  while !@name.empty? do
      @cohort = ""
      while @cohort.empty? do
        puts "Please enter the cohort of the student".center(80)
        puts "e.g. January/April/July/November".center(80)
        cohortresponse = STDIN.gets.chomp.downcase
        cohortcheck = cohortresponse
        if cohortcheck == "january"
          @cohort = "january"
        elsif cohortcheck == "april"
          @cohort = "april"
        elsif cohortcheck == "july"
          @cohort = "july"
        elsif cohortcheck == "november"
          @cohort = "november"
        else
          puts "Did you spell the month correctly?".center(80)
          spellcheck = STDIN.gets.chomp.downcase
          if spellcheck == "yes"
            @cohort = "no_valid_cohort"
          end
        end
      end

      add_to_list

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

      @name = STDIN.gets.chomp # sets name value so loop runs again from the top
  end
end

def add_to_list
  @students << {name: @name, cohort: @cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts
  puts "Villains Academy Student Directory".center(80)
  puts "...".center(80, "...")
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the rogram to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  #printcohort(@studentscohort)
  print_student_list
  print_footer
end

def print_header
  if @students.empty?
    puts
  else
    puts "The students of Villains Academy".center(80)
    puts "-------------".center(80)
  end
end

def print_student_list
  if @students.empty?
    puts
  else
    totalstudents = @students.length # setting total number of loops
    counter = 0
    while counter < totalstudents # while loop to loop until all students outputted
      puts "#{counter+1}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort)".center(80)
      counter += 1
      puts
    end
  end
end

def print_footer
  if @students.empty?
    puts "No students have been added to the directory"
  elsif @students.count != 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "Overall, we have #{@students.count} great student"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "The list has been saved"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  @name, @cohort = line.chomp.split(',')
    add_to_list
  end
  file.close
  puts "The list has been loaded and there are #{@students.count} students in the list"
end

def try_load_students
  if ARGV.first == nil
    load_students
    puts "\nstudents.csv loaded"
    puts "#{@students.count} students in the list\n\n"
  end
  filename = ARGV.first # first argument from command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# nothing happens until we call the methods
# and then print them
try_load_students
interactive_menu
