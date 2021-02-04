module StaticArticlesHelper
  require 'dotiw'
  include ActionView::Helpers::DateHelper

  def age_distance_of_time_in_words(date_of_birth: Time.gm(1993, 4, 7))
    distance_of_time_in_words(Time.now, date_of_birth)
  end

end
