# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_default_url_options

  protected

  def set_default_url_options
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
  end
end
