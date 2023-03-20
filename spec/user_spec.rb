require 'rails_helper'

RSpec.describe User do
  before(:each) do
    @attr = { :first_name => "Example",
              :last_name => "User",
              :email => "user@example.com",
              :password => "secret"}
    end

    it "should create a new instance given valid attributes" do
      User.create!(@attr)
    end 

    it "should require a first name" do
      no_name_user = User.new(@attr.merge(:first_name => ""))
      no_name_user.should_not be_vaild
    end
  end

