# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  skip_before_action :verify_authenticity_token # This lines should be removed once the applications goes live

  protected
end
