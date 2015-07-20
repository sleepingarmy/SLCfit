#in user model
#delayed jobs stuff
  def self.create_by_csv(file)
    file = params[:file].tempfile
    CSV.parse(File.read(file), headers: true, header_converters: :symbol).each do |row|
      next if User.find_by(email: row[:email].strip)
      user = User.new(email: row[:email], username: row[:username], first_name: row[:first_name], last_name: row[:last_name])
      if user.save
        #email the user with info
      else
        #email admin about  failures
      end
  end

#in users controller
#delayed jobs
  def create
    if file = params[:file]
      #.delay throws this in the delayed jobs table
      User.delay.create_by_csv(file)
      flash[:notice] = "Users are being uploaded!"
    else
      flash[:error] = "Please provide a users csv file"
    end
      redirect_to root_path
  end