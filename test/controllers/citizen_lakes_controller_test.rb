require 'test_helper'

class CitizenLakesControllerTest < ActionController::TestCase
  setup do
    @citizen_lake = citizen_lakes(:citizen_lake_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:citizen_lakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create citizen_lake" do
    assert_difference('CitizenLake.count') do
      post :create, citizen_lake: { previous_year: @citizen_lake.previous_year }
    end

    assert_redirected_to citizen_lake_path(assigns(:citizen_lake))
  end

  test "should show citizen_lake" do
    get :show, id: @citizen_lake
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @citizen_lake
    assert_response :success
  end

  test "should update citizen_lake" do
    patch :update, id: @citizen_lake, citizen_lake: { previous_year: @citizen_lake.previous_year }
    assert_redirected_to citizen_lake_path(assigns(:citizen_lake))
  end

  test "should destroy citizen_lake" do
    assert_difference('CitizenLake.count', -1) do
      delete :destroy, id: @citizen_lake
    end

    assert_redirected_to citizen_lakes_path
  end
end
