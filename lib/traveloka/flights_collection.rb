module Traveloka
	class FlightsCollection
		SERIALIZEABLE  =[:flight_sets, :search_object]
		attr_reader *SERIALIZEABLE
		attr_reader :raw_source
		include Enumerable
		def initialize search_object , hash_source
			@search_object = search_object
			@raw_source = hash_source
			@flight_sets = []
			build!
		end
		def inspect
			to_a
		end
		def to_a
			@flight_sets
		end
		def each(&block)
	    @flight_sets.each do |member|
	      block.call(member)
	    end
	  end
		def as_json *a
			flight_sets.map{|fs| fs.as_json}
		end
		
		def build!
			raw_source.each{|set|
				set= FlightSet.new(self, set)
				flight_sets << set if is_valid_flight_set?(set)
			}
		end

		def is_valid_flight_set?(fs)
			fs.flights.each{|fs|
				return false if (fs.airline_code =~ Regexp.new("^(#{Traveloka::Base::AIRLINE_ISO_CODE.keys.join("|")})$")).blank?
			}
		end

	end

end