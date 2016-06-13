class Link < ActiveRecord::Base
  validates :url, presence: true, url: true
  belongs_to :user

  scope :order_by_creation, -> { order(created_at: :desc) }

  def status
    read ? "read" : "unread"
  end
end
