class ApplicationController < ActionController::Base
  before_action :set_title
  def set_title
    @title = controller_name.capitalize
  end
end
