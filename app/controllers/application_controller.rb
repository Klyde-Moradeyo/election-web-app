# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action ActionMailer::Base.default_url_options = {:host => request.host_with_port}
end
