	module Traveloka
		class FlightSet
			SERIALIZEABLE = [:flights, :total_price, :origin, :destination, :start_at, :end_at]
			attr_reader *SERIALIZEABLE
			attr_reader :flight_collection, :raw_source

			def initialize flight_collection, raw_source
				@flight_collection = flight_collection
				@raw_source = raw_source
				build!
			end

			def as_json(options = { })
				ori_attr = [:total_price, :origin, :destination, :start_at, :end_at]
			 	Hash[ ori_attr.zip(ori_attr.map{|v| instance_variable_get("@#{v}".to_sym) }) ].merge(
			 		:flights => flights.map{|r| r.as_json })
			end

			def build!
				SERIALIZEABLE.each do |v|
					instance_variable_set("@#{v}".to_sym, send("get_#{v}".to_sym))
				end
			end

			def get_flights
				lists = []
			 (raw_source["CFR"].size).times do |index|
			 	lists << Flight.new(self , index)
			 end
			 lists
			end

			def get_total_price
				str = raw_source["IS"]
				md = str.split(".")[2]
				n = md.to_i 
				n > 0 ? n : nil
			end

			def get_origin
				raw_source["IS"].split('.').first
			end

			def get_destination
				raw_source["IS"].split('.')[1]
			end

			def get_start_at
				flights.first.takeoff_at
			end

			def get_end_at
				flights.last.landing_at
			end						
		end
	end