class Post < ActiveRecord::Base
  #attr_accessible :contents, :url
  validates :url,  presence: true
end
