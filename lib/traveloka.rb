require "json"
require "active_support/all"
require "mechanize"
require "traveloka/version"
require "traveloka/search_model"
require "traveloka/base"
require "traveloka/flights_collection"
require "traveloka/flight_set"
require "traveloka/flight"


module Traveloka
	def self.search _model = false
			raise LocalJumpError.new("no block or search model given") if !_model and !block_given?
			@model = _model
			if block_given?
				@model  = SearchModel.new
				yield @model
			end
		Base.new(@model).search!
	end
end
