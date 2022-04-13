class HomeController < ApplicationController
    before_action :index
    before_action :render_layout
    
    def index
        if user_signed_in?
            redirect_to user_ballots_path(current_user.id)
        end
    end

    def render_layout
        render layout: false
    end

end
