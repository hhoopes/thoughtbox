class Link < ActiveRecord::Base
  validates :url, presence: true, url: true
  belongs_to :user 
end
