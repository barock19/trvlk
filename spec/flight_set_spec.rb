require 'spec_helper'
 
describe Traveloka::FlightSet do
	include DummySupport
	subject{flight_set}
	# it{should respond_to(:start_at)}
	# it{should respond_to(:end_at)}
	describe '#start_at' do
		subject{flight_set.start_at}
	 	it_behaves_like 'instance of Time'
	 	it{should == @flight_set.flights.first.takeoff_at}
	end
	describe '#end_at' do
		subject{flight_set.end_at}
	 	it_behaves_like 'instance of Time'
	 	it{should == @flight_set.flights.last.landing_at}
	end
end