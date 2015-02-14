require 'test_helper'

class LakesControllerTest < ActionController::TestCase
  setup do
    @lake = lakes(:lake_one)
    @citizen = citizens(:citizen_one)
    sign_in @citizen
    @admin = admins(:admin_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lakes)
  end

  test "should get new if admin" do
    sign_out @citizen
    sign_in @admin
    get :new
    assert_response :success
  end

  test "should not get new if not admin" do
    get :new
    assert_redirected_to lakes_path
  end

  test "should create lake when admin" do
    assert_difference('Lake.count') do
      sign_out @citizen
      sign_in @admin
      post :create, lake: { county: @lake.county, lake_name: @lake.lake_name, lake_number: @lake.lake_number, previous_year: @lake.previous_year, sample_depth: @lake.sample_depth, site_number: @lake.site_number }
    end

    assert_redirected_to lake_path(assigns(:lake))
  end

  test "should not create lake when not admin" do
    assert_no_difference('Lake.count') do
      post :create, lake: { county: @lake.county, lake_name: @lake.lake_name, lake_number: @lake.lake_number, previous_year: @lake.previous_year, sample_depth: @lake.sample_depth, site_number: @lake.site_number }
    end

    assert_redirected_to lakes_path
  end

  test "should show lake" do
    get :show, id: @lake
    assert_response :success
  end

  test "should get edit if admin" do
    sign_out @citizen
    sign_in @admin
    get :edit, id: @lake
    assert_response :success
  end

  test "should not get edit if not admin" do
    get :edit, id: @lake
    assert_redirected_to lakes_path
  end

  test "should update lake if admin" do
    sign_out @citizen
    sign_in @admin
    patch :update, id: @lake, lake: { county: @lake.county, lake_name: @lake.lake_name, lake_number: @lake.lake_number, previous_year: @lake.previous_year, sample_depth: @lake.sample_depth, site_number: @lake.site_number }
    assert_redirected_to lake_path(assigns(:lake))
  end

  test "should not update lake if not admin" do
    patch :update, id: @lake, lake: { county: @lake.county, lake_name: @lake.lake_name, lake_number: @lake.lake_number, previous_year: @lake.previous_year, sample_depth: @lake.sample_depth, site_number: @lake.site_number }
    assert_redirected_to lakes_path
  end

  test "should destroy lake if admin" do
    sign_out @citizen
    sign_in @admin
    assert_difference('Lake.count', -1) do
      delete :destroy, id: @lake
    end

    assert_redirected_to lakes_path
  end

  test "should not destroy lake if not admin" do
    assert_difference('Lake.count', 0) do
      delete :destroy, id: @lake
    end

    assert_redirected_to lakes_path
  end
end
