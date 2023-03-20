require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "Joe", last_name: "Black", email: "joe@test.com", password: "password")
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end 

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end 

    it "is not vaild without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is valid with a first name" do
      subject.first_name = "Billy"
      expect(subject).to be_valid
    end 

    it "is valid with a last name" do
      subject.last_name = "Obey"
      expect(subject).to be_valid
    end

    it "is valid with an email" do
      subject.email = "bill@test.com"
      expect(subject).to be_valid
    end 

    it "is valid with a password" do
      subject.password = "password"
      expect(subject).to be_valid
    end 
  end
end

