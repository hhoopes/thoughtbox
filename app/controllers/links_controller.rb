class LinksController < ApplicationController
  # before_action :must_login, only: [:create, :index]

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      flash[:info] = "'#{@link.title}' saved!"
      redirect_to root_path
    end
  end

private
  def link_params
    params.require(:link).permit(:url, :read, :title)
  end
end
