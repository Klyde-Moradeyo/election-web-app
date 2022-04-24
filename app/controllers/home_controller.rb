class HomeController < ApplicationController
  before_action :index
  before_action :render_layout
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to user_ballots_path(current_user.id)
    else
      redirect_to it_path
    end
  end

  def render_layout
    render layout: false
  end
end
