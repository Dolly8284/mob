class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
     # validates :name, presence: true
      
  # has_many :comments, through: :posts
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, disable_joins: true
  # has_one :latest_post, -> { order('posts.created_at desc').limit(1) }, class_name: 'Post'


  #  def comments
  #   Comment.where(post_id: posts.pluck(:id))
  # end
end
  #  after_initialize do |user|
  #   puts "New create object!"
  # end

  # after_find do |user|
  #   puts "Find the data with I'D!"
  # end

  # after_touch do |user|
  #   puts "Touched an data create"
  # end
# end
