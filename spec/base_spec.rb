require 'spec_helper'

describe Traveloka::Base do
	include DummySupport
	let(:base){Traveloka::Base.new(dummy_model)}
	subject{base}
	describe "#build_request_body" do
		subject{base.build_request_body}
		it{should be_an_instance_of(Hash)}
		context "numAdults is converted to String" do
		  it{base.build_request_body['data']['numSeats']['numAdults'][':v'].should be_an_instance_of(String)}
		end
	end
	describe '#search!' do

		describe "#result_raw" do
			# subject{base.result_raw}
			it{base.result_raw.should be_an_instance_of(Array)}
			context "before search!" do
				it{base.result_raw.size.should == 0}
			end
			context "after search!" do
				before(:each) do
					stub(subject).to_home{nil}
					stub(subject).page_search{nil}
					stub(subject)._search{nil}
					stub(subject).complete?{true}
					stub(subject).result_raw{[1,2,3]}
					subject.search!
				end
			  it{subject.result_raw.size.should > 0}

			end
		end
	end
end