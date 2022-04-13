class HomeController < ApplicationController
    before_action :render_layout
    def index
        if user_signed_in?
            redirect_to ballots_path
        end
    end

    def render_layout
        render layout: false
    end

end
