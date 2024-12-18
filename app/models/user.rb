#require 'bcrypt'

class User < ApplicationRecord
  has_many :user_answers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # BCryptでパスワードをハッシュ化するメソッド
  
  #def password=(new_password)
    #self.pass = BCrypt::Password.create(new_password)
  #end

  # パスワード認証のメソッド
  #def authenticate(input_password)
    #BCrypt::Password.new(self.pass) == input_password
  #end
end