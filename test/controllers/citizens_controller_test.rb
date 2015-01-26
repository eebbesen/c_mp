require 'test_helper'

class CitizensControllerTest < ActionController::TestCase
  setup do
    @citizen = citizens(:citizen_one)
    sign_in @citizen
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:citizens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # eventually you'll not have to be logged in to create a citizen, since that's a catch 22
  test "should create citizen" do
    assert_difference('Citizen.count') do
      post :create, citizen: { clmp_number: @citizen.clmp_number, email: 'citizen3@mn.gov', first_name: @citizen.first_name, 
        last_name: @citizen.last_name, phone_1: @citizen.phone_1, phone_2: @citizen.phone_2, 
        password: 'Pa55w0Rd1', password_confirmation: 'Pa55w0Rd1' }
    end

    assert_redirected_to citizen_path(assigns(:citizen))
  end

  test "should show citizen" do
    get :show, id: @citizen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @citizen
    assert_response :success
  end

  test "should update citizen" do
    patch :update, id: @citizen, citizen: { clmp_number: @citizen.clmp_number, email: @citizen.email, first_name: @citizen.first_name, 
      last_name: @citizen.last_name, phone_1: @citizen.phone_1, phone_2: @citizen.phone_2 }
    assert_redirected_to citizen_path(assigns(:citizen))
  end

  test "should destroy citizen" do
    assert_difference('Citizen.count', -1) do
      delete :destroy, id: @citizen
    end

    assert_redirected_to citizens_path
  end
end
