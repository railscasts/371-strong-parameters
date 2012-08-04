class Post < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :content, :inline_images
end
