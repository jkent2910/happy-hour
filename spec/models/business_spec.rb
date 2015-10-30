require 'rails_helper'

RSpec.describe Business, type: :model do
  context "presence validations" do
    [:name, :start_time, :end_time].each do |attr|
      it "validates presence of #{attr}" do
        expect(subject).to validate_presence_of(attr)
      end
    end
  end

  context "uniqueness validations" do
    foo = Business.new(:name=>"Foo")
    it "validates uniqueness" do 
      foo.should_not be_valid
      foo.errors[:name].should include("has already been taken")
    end
  end
end