class AboutController < ApplicationController
  def index
    @title = "自己紹介、このサイトについて | #{Rails.configuration.site_name}"
  end
end
