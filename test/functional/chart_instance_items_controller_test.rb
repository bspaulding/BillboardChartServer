require 'test_helper'

class ChartInstanceItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chart_instance_items)
  end

  test "should show chart_instance_item" do
    get :show, :id => chart_instance_items(:one).to_param
    assert_response :success
  end
end
