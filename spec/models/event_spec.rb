require 'rails_helper'

RSpec.describe Event, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do 
		@event = FactoryBot.create(:event)  	
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@event).to be_a(event)
    end

		describe "#start_date" do
		  it { expect(@event).to validate_presence_of(:start_date) }
    end

    describe "start_must_be_after_now" do
      it "is not valid if start_date is before now" do
        invalid_event = FactoryBot.build(:event, start_date: Time.now - 1.day)
        expect(invalid_event).not_to be_valid
        expect(invalid_event.errors.include?(:start_date)).to eq(true)
      end
      #it { is_expected.to allow_value("0123456789").for(:start_date) }
      it { is_expected.to_not allow_value(Time.now - 1.day).for(:start_date) }
    end
  end
    
=begin
    describe "#last_name" do
		  it { expect(@event).to validate_presence_of(:last_name) }
    end
    
    describe "#description" do
		  it { expect(@event).to validate_presence_of(:description) }
	  end
  end

  context "associations" do
    it { expect(@event).to have_many(:attendances).with_foreign_key(:attendee_id) }
    it { expect(@event).to have_many(:events).with_foreign_key(:admin_id) }
  end

=end
end
