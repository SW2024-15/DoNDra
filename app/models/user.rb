#require 'bcrypt'

class User < ApplicationRecord
  has_many :user_answers
  has_many :answered_questions, through: :user_answers, source: :question
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end