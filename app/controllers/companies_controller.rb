class CompaniesController < ApplicationController
  before_action :usr_login

  def show
    @company = Comapny.find(params[:id])
  end

  def new
  end

  def created
  end

  def edit
  end

  def update
  end

  private
  def user_login
    if !current_user
      redirect_to user_session_path, notice: "ログインしてください"
    end
  end
end