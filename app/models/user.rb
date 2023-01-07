class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  #  after_initialize do |user|
  #   puts "New create object!"
  # end

  # after_find do |user|
  #   puts "Find the data with I'D!"
  # end

  # after_touch do |user|
  #   puts "Touched an data create"
  # end
end
