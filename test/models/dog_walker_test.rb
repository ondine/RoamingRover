require 'test_helper'

class DogWalkerTest < ActiveSupport::TestCase
  def test_dogwalker_can_be_created_with_no_arguments
	assert_instance_of DogWalker, DogWalker.new
  end
end
