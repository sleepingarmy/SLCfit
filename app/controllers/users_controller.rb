class UsersController < ApplicationController

  #delayed jobs
  def create
    if file = params[:file]
      #.delay throws this in the delayed jobs table
      User.delay.create_by_csv(file)
      flash[:notice] = "Users are being uploaded!"
    else
      flash[:error] = "Please provide a users csv file"
    end
      redirect_to root_path
  end
end
