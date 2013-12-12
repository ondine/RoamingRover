require 'test_helper'

class WalkerBidsTest < ActiveSupport::TestCase
  def test_walkerbids_can_be_created_with_no_arguments
	assert_instance_of WalkerBids, WalkerBids.new
  end
end