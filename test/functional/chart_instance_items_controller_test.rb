require 'test_helper'

class ChartInstanceItemsControllerTest < ActionController::TestCase
  test "should get index" do
    chart_instance_item = FactoryGirl.create(:chart_instance_item)

    get :index, :chart_instance_id => chart_instance_item.chart_instance.to_param, :chart_id => chart_instance_item.chart_instance.chart.to_param

    assert_response :success
    assert_not_nil assigns(:chart_instance_items)
  end

  test "should show chart_instance_item" do
    chart_instance_item = FactoryGirl.create(:chart_instance_item)

    get :show, :id => chart_instance_item.to_param, :chart_instance_id => chart_instance_item.chart_instance.to_param, :chart_id => chart_instance_item.chart_instance.chart.to_param

    assert_response :success
  end
end
