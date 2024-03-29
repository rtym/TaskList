class User < ActiveRecord::Base
  attr_accessible :id,
                  :created_at,
                  :updated_at,
                  :name,
                  :surname,
                  :email,
                  :password,
                  :password_hash,
                  :password_salt,
                  :password_confirmation

  attr_accessor :password

  has_many :tasks

  before_save :encrypt_password

  validates :email, :presence => true,
            :length => {:minimum => 3, :maximum => 254},
            :uniqueness => true,
            :format => {:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i}
  validates_confirmation_of :password
  validates_presence_of :password
  validates_presence_of :name
  validates_presence_of :surname

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def full_name
    name + ' ' + surname
  end

  def self.search_user query, limit = 5
    where(%Q{`name` LIKE '%#{query}%' OR `surname` LIKE '%#{query}%'}).limit(limit)
  end
end

