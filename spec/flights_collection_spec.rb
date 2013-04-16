require 'spec_helper'
 
describe Traveloka::FlightsCollection do
	before(:each) do
	  @search_object = DummyModel.new(:flight_date => (Time.now+2.day).to_date, :origin => 'CGK', :destination => 'DPS')
	  @fc = Traveloka::FlightsCollection.new @search_object , RESULT_DUMMY
	end
	subject{@fc}
	# it{should respond_to(:search_object)}
	# it{should respond_to(:raw_source)}
	# it{should respond_to(:flights)}
	# it{should respond_to(:build!)}
end