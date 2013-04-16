require 'spec_helper'
 
describe Traveloka::FlightSet do
	include DummySupport
	subject{flight_set}
	# it{should respond_to(:start_at)}
	# it{should respond_to(:end_at)}
	describe '#start_at' do
		subject{flight_set.start_at}
		xit{should be_an_instance_of(Time)}
	end
	describe '#total_price' do
		subject{flight_set.total_price}
		it{should be_an_instance_of(Fixnum)}
	end

end