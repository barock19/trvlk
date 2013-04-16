require 'spec_helper'
shared_examples_for 'valid airport code' do
	it{should match(/[A-Z]{3,}/)}
end
 describe Traveloka::Flight do
 		include DummySupport
 		subject{flight}
  	# it{should respond_to(:takeoff_at)}
  	# it{should respond_to(:landing_at)}
  	# it{should respond_to(:airline_code)}
  	# it{should respond_to(:publish_fare)}
  	# it{should respond_to(:promo)}
  	# it{should respond_to(:search_object)}
  	describe '#takeoff_at' do
  		subject{flight.takeoff_at}
  		it{should be_an_instance_of(Time)}
	  	it{should < @flight.landing_at}
	  end
  	describe "#landing_at" do
			subject{flight.landing_at}
  		it{should be_an_instance_of(Time)}
	  	it {should > @flight.takeoff_at}
	  end
	  describe "#publish_fare" do
			subject{flight.publish_fare}	  	
	  	it{should be_an_instance_of(Fixnum)}
	  	it{should > 0}
	  end
	  describe "#airline_code" do
	  	xit{flight.airline_code.should be_on_off}
	  end
	  describe "#origin" do
	  	subject{flight.origin}
			it_behaves_like 'valid airport code'
	  end
	  describe "#destination" do
	  	subject{flight.destination}
			it_behaves_like 'valid airport code'
	  end

 end 