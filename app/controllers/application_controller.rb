class ApplicationController < ActionController::Base
  def set_title
    @title = generate_title
  end

  def generate_title(title = "")
    title = title.empty? ? "📚" : title
    "#{title} | #{Rails.configuration.site_name}"
  end
end
