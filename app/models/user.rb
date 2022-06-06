class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },  format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 4 }



  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = ?', email.downcase.strip).first
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
