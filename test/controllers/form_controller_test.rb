require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get form_Index_url
    assert_response :success
  end

end
