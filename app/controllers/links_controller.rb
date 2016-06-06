class LinksController < ApplicationController
  def index
    if current_user
      @links = Link.all
    else
      must_login
    end
  end
end
