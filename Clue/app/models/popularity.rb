class Popularity < ActiveRecord::Base
	belongs_to :topic
	belongs_to :day

	def totalPop
		self.twitter_popularity + self.facebook_popularity + self.google_trend_index
	end

	def self.popularitiesAsHash(popularities)
    pop_array = []
    popularities.each do |popobj|
      my_hash = {
        date: popobj.day.date,
        twitter_count: popobj.twitter_popularity,
        facebook_count: popobj.facebook_popularity,
        google_count: popobj.google_trend_index
      }
      pop_array << my_hash
    end
    pop_array
  end

  def self.popularitiesAsJSON(popularities)
    self.popularitiesAsHash(popularities).to_json
  end
end
