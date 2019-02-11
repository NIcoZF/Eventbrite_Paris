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
      expect(@event).to be_a(Event)
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
      it { is_expected.to_not allow_value(Time.now - 1.day).for(:start_date) }
    end
    
    describe "#duration" do
      it { expect(@event).to validate_presence_of(:duration) }
      it { is_expected.to_not allow_value(2.5).for(:duration) }
      it { is_expected.to_not allow_value(-5).for(:duration) }
    end
=begin
    describe "multiple_of_5" do
      it "is not valid if duration is not a multiple of 5" do
        invalid_event = FactoryBot.build(:event, duration: 7)
        expect(invalid_event).not_to be_valid
        expect(invalid_event.errors.include?(:duration)).to eq(true)
      end
      it { is_expected.to_not allow_value(7).for(:duration) }
    end
=end
    describe "#title" do
      it { expect(@event).to validate_presence_of(:description) }
      it { is_expected.to_not allow_value(Faker::Lorem.characters(141)).for(:title) }
      it { expect(@event).to validate_length_of(:title).is_at_least(5) }
    end

    describe "#description" do
      it { expect(@event).to validate_presence_of(:description) }
      it { is_expected.to_not allow_value(Faker::Lorem.characters(1001)).for(:description) }
      it { expect(@event).to validate_length_of(:description).is_at_least(20) }
    end

    describe "#price" do
      it { expect(@event).to validate_presence_of(:price) }
      it { is_expected.to_not allow_value(Faker::Number.number(4)).for(:price) }
      it { expect(@event).to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
    end

    describe "#location" do
      it { expect(@event).to validate_presence_of(:location) }
    end
  end

  context "associations" do
    it { expect(@event).to belong_to(:admin).class_name("User") }
    it { expect(@event).to have_many(:attendances) }
    it { expect(@event).to have_many(:users).with_foreign_key(:attendee_id) }
  end


end
