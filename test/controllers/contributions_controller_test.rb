require 'test_helper'

class ContributionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contributions_new_url
    assert_response :success
  end

end
