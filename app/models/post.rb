class Post < ApplicationRecord

  has_one_attached :avatar 
  belongs_to :user
	has_many :comments, dependent: :destroy
  validates :title, presence: true, length:{ minimum:4, maximum: 100}
  validates :body, presence: true, length:{minimum:8, maximum:200}

  # using Polymorphic Associations 
  has_many :poly_comments, as: :commentable

  # has_one  :latest_comment, -> { order('comments.created_at desc').limit(1) }, class_name: 'Comment'
  # using scope in this method
  scope :popular, -> { where('views <= ?', 10) }

end
