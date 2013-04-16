module Traveloka
	class FlightSet
		SERIALIZEABLE = [:total_price, :origin, :destination, :start_at, :end_at, :flights]
		attr_reader *SERIALIZEABLE
		attr_reader :flight_collection, :raw_source

		def initialize flight_collection, raw_source
			@flight_collection = flight_collection
			@raw_source = raw_source
			build!
		end


		def build!
			SERIALIZEABLE.each do |v|
				instance_variable_set("@#{v}".to_sym, send("get_#{v}".to_sym))
			end
		end

		def get_flights

		end

		def get_total_price
			str = raw_source["IS"]
			md = str.split(".")[2]
			n = md.to_i 
			n > 0 ? n : nil
		end

		def get_origin
			str = raw_source["IS"]

		end

		def get_destination
		end

		def get_start_at
		end

		def get_end_at
		end						
	end
end