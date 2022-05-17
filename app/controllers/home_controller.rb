class HomeController < ApplicationController
  before_action :index
  before_action :render_layout
  skip_before_action :authenticate_user!

  def index
    if user_signed_in? && current_user.has_role?(:admin)
      redirect_to users_path
    elsif user_signed_in?
      redirect_to user_ballots_path(current_user.id)
    elsif defined?session[:voter]["username"]
      @voter = Voter.find_by(username: session[:voter]["username"])
      @ballot = Ballot.find_by(id: @voter.ballot_id)
      redirect_to user_ballot_waiting_room_path(@ballot.user_id, @ballot)
    else
      redirect_to it_path
    end
  end

  def render_layout
    render layout: false
  end
end
