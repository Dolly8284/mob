class Post < ApplicationRecord

	has_one_attached :avatar 
	 belongs_to :user
	has_many :comments, dependent: :destroy
  # validates :title, presence: true,
                    # length: { minimum: 5 }

end
