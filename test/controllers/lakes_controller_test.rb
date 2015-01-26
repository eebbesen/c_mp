require 'test_helper'

class LakesControllerTest < ActionController::TestCase
  setup do
    @lake = lakes(:lake_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lake" do
    assert_difference('Lake.count') do
      post :create, lake: { county: @lake.county, lake_name: @lake.lake_name, lake_number: @lake.lake_number, previous_year: @lake.previous_year, sample_depth: @lake.sample_depth, site_number: @lake.site_number }
    end

    assert_redirected_to lake_path(assigns(:lake))
  end

  test "should show lake" do
    get :show, id: @lake
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lake
    assert_response :success
  end

  test "should update lake" do
    patch :update, id: @lake, lake: { county: @lake.county, lake_name: @lake.lake_name, lake_number: @lake.lake_number, previous_year: @lake.previous_year, sample_depth: @lake.sample_depth, site_number: @lake.site_number }
    assert_redirected_to lake_path(assigns(:lake))
  end

  test "should destroy lake" do
    assert_difference('Lake.count', -1) do
      delete :destroy, id: @lake
    end

    assert_redirected_to lakes_path
  end
end
