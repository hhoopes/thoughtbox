class Api::V1::LinksController < ApplicationController
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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id]).update(link_params)
    redirect_to root_path
  end

private
  def link_params
    params.require(:link).permit(:url, :read, :title)
  end
end
