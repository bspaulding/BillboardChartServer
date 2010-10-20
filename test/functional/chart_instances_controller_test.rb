require 'test_helper'

class ChartInstancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chart_instances)
  end

  test "should show chart_instance" do
    get :show, :id => chart_instances(:one).to_param
    assert_response :success
  end
end
