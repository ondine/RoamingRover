require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def test_client_can_be_created_with_no_arguments
	assert_instance_of Client, Client.new
  end
end