require 'spec_helper'
 
describe Traveloka::FlightsCollection do
	include DummySupport
	subject{flight_collection}
	describe '#flights' do
		subject{flight_collection.flight_sets}	
		it{should be_an_instance_of(Array)}
		describe '#first'do
			subject{flight_collection.flight_sets.first}	
			it{should be_an_instance_of(Traveloka::FlightSet)}
		end
	end
	describe "#as_json" do
		subject{flight_collection.as_json}
		it{should be_an_instance_of(Array)}
		describe "#first" do
			subject{flight_collection.as_json.first}
			it{should be_an_instance_of(Hash)}
		end
	end

end