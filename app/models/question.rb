class Question < ActiveRecord::Base
	# Relations
  belongs_to :user
  has_many :votes
  has_many :comments

end
