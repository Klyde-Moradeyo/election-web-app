# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # These 2 lines should be removed once the applications goes live
  before_action :set_default_url_options
  skip_before_action :verify_authenticity_token

  def set_default_url_options
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
  end
end
