require 'test_helper'

class ChartInstancesControllerTest < ActionController::TestCase
  test "should get index" do
    chart_instance = FactoryGirl.create(:chart_instance)

    get :index, :chart_id => chart_instance.chart.id
    
    assert_response :success
    assert_not_nil assigns(:chart_instances)
  end

  test "should show chart_instance" do
    chart_instance = FactoryGirl.create(:chart_instance)

    get :show, :id => chart_instance.to_param, :chart_id => chart_instance.chart.to_param
    
    assert_response :success
  end
end
