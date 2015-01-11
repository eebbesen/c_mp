require 'test_helper'

class CitizenTest < ActiveSupport::TestCase
  test "should not save citizen without a first_name" do
    citizen = Citizen.new
    assert_not citizen.save, "Saved the citizen without a first_name"
  end

  test "should not save citizen without a last_name" do
    citizen = Citizen.new(first_name: 'Adam')
    assert_not citizen.save, "Saved the citizen without a last_name"
  end

  test "should not save citizen without a phone_1" do
    citizen = Citizen.new(first_name: 'Adam', last_name: 'West')
    assert_not citizen.save, "Saved the citizen without a phone_1"
  end

  test "should not save citizen without an email" do
    citizen = Citizen.new(first_name: 'Adam', last_name: 'West', phone_1: '6515551212')
    assert_not citizen.save, "Saved the citizen without a phone_1"
  end
end
