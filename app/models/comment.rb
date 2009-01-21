class Comment < ActiveRecord::Base
  belongs_to :painting 
  belongs_to :artist
end
