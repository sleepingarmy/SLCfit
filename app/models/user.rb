class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :goals

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
end
