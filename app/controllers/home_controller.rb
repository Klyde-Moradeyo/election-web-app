class HomeController < ApplicationController
    before_action :render
    def index
        if user_signed_in?
            redirect_to ballots_path
        end
    end

    def render
        render layout: false
    end

end
