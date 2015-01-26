require 'test_helper'

class SampleTest < ActiveSupport::TestCase
  test "should not save sample without a lake" do
    sample = Sample.new
    assert_not sample.save, "Saved the sample without a lake"
  end

  test "should not save sample without a citizen" do
    sample = Sample.new
    sample.lake = Lake.new
    assert_not sample.save, "Saved the sample without a citizen"
  end
end
