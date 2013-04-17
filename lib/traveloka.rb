require "json"
require "active_support/all"
require "mechanize"
require "traveloka/version"
require "traveloka/base"
require "traveloka/flights_collection"
require "traveloka/flight_set"
require "traveloka/flight"


module Traveloka
	def self.search model
		Base.new(model).search!
	end
end
