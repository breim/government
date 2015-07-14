class Comment < ActiveRecord::Base
	# Relations
  belongs_to :user
  belongs_to :question, counter_cache: true
end
