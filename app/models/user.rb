class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Before filter
  before_validation :downcase_email

  # Attributes Validate
  validates_uniqueness_of :auth_token
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => 'wrong email address'

  before_create :generate_authentication_token!

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end


  private

  def downcase_email
    email.downcase! if email.present?
  end
end
