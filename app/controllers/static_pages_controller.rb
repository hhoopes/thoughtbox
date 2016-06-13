class StaticPagesController < ApplicationController
  before_action :must_login, only: [:home]

  def home
    @link = current_user.links.build
    @links = current_user.links.order_by_creation
  end

end
