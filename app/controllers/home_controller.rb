class HomeController < ApplicationController
    render layout: false
    def index
        if user_signed_in?
            redirect_to ballots_path
        end
    end

end
