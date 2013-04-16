module Traveloka
	class FlightsCollection
		attr_reader :flights, :search_object
		attr_reader :raw_source
		
		def initialize search_object , hash_source
			@search_object = search_object
			@raw_source = hash_source
			build!
		end

		def build!
		end

		def build_flights
		end

	end

end