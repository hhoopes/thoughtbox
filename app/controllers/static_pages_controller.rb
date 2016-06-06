class StaticPagesController < ApplicationController
  before_action :must_login, only: [:home]

  def home
    if current_user
      @link = current_user.links.build
      @links = current_user.links.all
    end
  end

end
