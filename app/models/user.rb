class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :goals
  has_many :biometrics, dependent: :destroy
  has_one :info, dependent: :destroy

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.signup_email(self).deliver_now
  end

end
