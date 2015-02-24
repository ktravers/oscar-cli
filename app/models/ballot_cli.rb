class BallotCLI
  attr_accessor :user_name, :on
  APPROVED_COMMANDS = [:show, :help, :vote, :print, :exit]

  def initialize
    @data = OscarScraper.new.call ### what is this for?
    @on = true
    puts "Oscar Ballot:\n Get ready to make your picks!\n"
    puts "First, please enter your name:"
    @user_name = gets.strip
    puts "Thank you, #{@user_name}.\n"
  end

  def on?
    @on
  end

  def call              #=> creates simple loop
    while on?           #   where program will run
      self.get_command  #   until @on set to false
    end                 #   see exit method below
  end

  def exit
    @on = false
  end

  def get_command
    puts "Please enter a valid command."
    puts "(Enter 'help' to see a list of valid commands)"
    self.command_request
  end

  def command(input)
    send(input) if command_valid?(input) 
  end

  def command_valid?(input)
    APPROVED_COMMANDS.include?(input.downcase.to_sym)
  end

  def command_request
    self.command(user_input)
  end

  def user_input
    gets.downcase.strip
  end


  def help
    puts "---------------------- Valid Commands ----------------------"
    puts ""
    puts "-- show  :  display nominees in single category or full list"
    puts "-- vote  :  select a category, then make your pick"
    puts "-- print :  saves your current picks to a text file"
    puts "-- help  :  displays this help menu"
    puts "-- exit  :  exits this program"
    puts ""
    puts "------------------------------------------------------------"
    puts ""
  end
 

  def show
    puts "Show nominees: single category or full list?"
    puts "(enter 'single' or 'full')"
    input = gets.downcase.strip
  end


  # def list
  #   Song.all.each_with_index do |song,i|
  #     puts "#{i+1}. #{song}"
  #   end
  # end

  # def play
  #   puts "Please enter a song name or number. \n"
  #   play_song(user_input)
  # end

  # def play_song(song_to_play)
  #   if song_to_play.to_i > 0
  #     puts "\nNow playing #{Song.all[song_to_play.to_i]}\n"
  #   else
  #     puts "\nNow playing #{Song.find_by_name(song_to_play)}"
  #   end
  # end

  # def exit
  #   abort("Goodbye!!!")
  # end

  # def list_names
  #   get_student_names.each.with_index(1) do |name, i|
  #     puts "#{i}. #{name}"
  #     puts ""
  #   end
  # end

  # def profile
  #   puts "Please wait. Fetching students..."
  #   students = create_student_hash
  #   list_names
  #   puts "Enter a student index:"
  #   student_index = gets.strip.to_i - 1
  #   puts "Name: #{students[student_index][:name]}"
  #   puts ""
  #   puts "Bio:\n#{students[student_index][:bio]}"
  #   puts ""
  #   puts "Education:\n#{students[student_index][:education]}"
  #   puts ""
  #   puts "Work:\n#{students[student_index][:work]}"
  #   puts ""
  #   puts "Coder Cred:"
  #   students[student_index][:coder_cred].each {|link| puts link}
  #   puts ""
  # end

end