
class DummyModel
	attr_accessor :flight_date, :origin, :destination, :adults , :children
	def initialize *args
		if args[0].class == Hash
			args[0].each{|k, v|
				send("#{k}=".to_sym, v)
			}
		end
	end

	def adults
		@adults ||= 1
	end

	def children
		@children ||= 0
	end

	def infants
		@infants ||= 0
	end

	def flight_date=(str)
		@flight_date = str.to_date
	end
end

module DummySupport
	def dummy_model
		@dummy_model ||= DummyModel.new(:flight_date => (Time.now+2.day).to_date, :origin => 'CGK', :destination => 'DPS')
	end
	def flight_collection
		@flight_collection ||= Traveloka::FlightsCollection.new(dummy_model, RESULT_DUMMY['data'])
	end
	def flight_set
		@flight_set ||= Traveloka::FlightSet.new(flight_collection, RESULT_DUMMY['data'][rand(RESULT_DUMMY['data'].size - 1)])
	end 
	def flight
		@flight ||= Traveloka::Flight.new(flight_set)
	end
end
