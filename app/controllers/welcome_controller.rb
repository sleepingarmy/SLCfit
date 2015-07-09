class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to goals_path
    end
  end

  def about
  end

  def contact
  end

end
