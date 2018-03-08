class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show
    @projects = Project.all
    set_user
    authorize @user
  end

  def edit
    @technologies = Technology.all
    set_user
    authorize @user
  end

  def update
    raise
    @user = current_user
    @user.update(user_params)
    @user.technologies = []
    tech_p_params[:technologies].each do |tech|
      if tech.length > 0
        @technology = Technology.find(tech.to_i)
        @user.technologies  << @technology
      end
    end
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
    authorize @user
  end


  private

  def tech_p_params
    params[:user].require(:tech_project).permit({technologies:[]})
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :photo, :photo_cache)
  end
end

