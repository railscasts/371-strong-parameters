class Topic < ActiveRecord::Base
  has_many :posts
  accepts_nested_attributes_for :posts
end
