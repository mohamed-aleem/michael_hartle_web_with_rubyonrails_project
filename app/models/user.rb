class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       confirmation: true,
                       length: {minimum: 6}
  before_save :encrypt_password
  
  def authenticate(user_password)
    return self if has_password?(user_password)
  end
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  private
    def encrypt_password
      self.salt = make_salt unless self.has_password?(password)
      self.encrypted_password = encrypt(password)
    end
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
