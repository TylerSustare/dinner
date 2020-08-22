require 'test_helper'

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    homepage_index_url = '/'
    get homepage_index_url
    assert_response :success
  end

  test "should get tester" do
    homepage_tester_url = '/tester'
    get homepage_tester_url
    assert_response :success
  end

end
