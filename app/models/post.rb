class Post < ApplicationRecord

  has_one_attached :avatar 
  belongs_to :user
  # after_destroy {notify admin of bad behavior}
	has_many :comments, dependent: :destroy
  validates :title, presence: true, length:{ minimum:4, maximum: 50}
  
  validates :text, presence: true, length:{minimum:8, maximum:60}
end
