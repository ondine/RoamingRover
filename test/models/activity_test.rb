#test_should_show_activity:
class ActivityTest < ActiveSupport::TestCase
  def test_activity_can_be_created_with_no_arguments
	assert_instance_of Activity, Activity.new
  end
end
