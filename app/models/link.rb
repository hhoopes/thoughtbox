class Link < ActiveRecord::Base
  validates :url, presence: true, url: true
  belongs_to :user

  def status
    read ? "read" : "unread"
  end
end
