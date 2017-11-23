class StaticController < ApplicationController

  def home
    if logged_in?
      redirect_to events_path
    end
  end
end
