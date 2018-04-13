require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get title:string" do
    get project_title:string_url
    assert_response :success
  end

  test "should get description:string" do
    get project_description:string_url
    assert_response :success
  end

end
