require 'test_helper'

class SamplesControllerTest < ActionController::TestCase
  setup do
    @sample = samples(:sample_one)
    citizen = citizens(:citizen_one)
    @lake = lakes(:lake_one)
    @sample.lake_id = @lake.id
    @sample.citizen_id = citizen.id
    sign_in citizen
  end

  test "should get index with lake_id" do
    get :index, {lake_id: @lake.id}
    assert_response :success
    assert_not_nil assigns(:samples)
  end

  test "should get index without lake_id" do
    get :index, {lake_id: nil}
    assert_response :success
    assert_not_nil assigns(:samples)
  end

  test "should get index without lake_id where citizen has no samples" do
    sign_out citizens(:citizen_one)
    sign_in citizens(:citizen_two)
    get :index, {lake_id: nil}
    assert_response :success
    assert_not_nil assigns(:samples)
  end

  test "should get new" do
    get :new, {lake_id: @lake.id}
    assert_response :success
  end

  test "should get new without lake_id" do
    get :new, {}
    assert_response :success
  end

  test "should create sample" do
    CitizenLake.where(lake_id: @sample.lake_id, citizen_id: @sample.citizen_id).destroy_all
    assert !CitizenLake.exists?(lake_id: @sample.lake_id, citizen_id: @sample.citizen_id), 'CitizenLake for this combo already exists'

    assert_difference('Sample.count') do
      post :create, sample: { date: @sample.date, is_bottom: @sample.is_bottom, notes: @sample.notes, 
        physical_appearance: @sample.physical_appearance, recreational_suitability: @sample.recreational_suitability, 
        secchi_depth: @sample.secchi_depth, time: @sample.time, water_color: @sample.water_color, 
        lake_id: @sample.lake_id, citizen_id: @sample.citizen_id}
    end

    assert_redirected_to sample_path(assigns(:sample))

    assert CitizenLake.exists?(lake_id: @sample.lake_id, citizen_id: @sample.citizen_id), 'CitizenLake should have been created'
  end

  test "should not create a citizen_lakes record if one already exists" do
    assert CitizenLake.exists?(lake_id: @sample.lake_id, citizen_id: @sample.citizen_id)

    post :create, sample: { date: @sample.date, is_bottom: @sample.is_bottom, notes: @sample.notes, 
      physical_appearance: @sample.physical_appearance, recreational_suitability: @sample.recreational_suitability, 
      secchi_depth: @sample.secchi_depth, time: @sample.time, water_color: @sample.water_color, 
      lake_id: @sample.lake_id, citizen_id: @sample.citizen_id}

    assert_equal 1, CitizenLake.where(lake_id: @sample.lake_id, citizen_id: @sample.citizen_id).count, 'should only have one CitizenLake for this combo'
  end

  test "should show sample" do
    get :show, id: @sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sample
    assert_response :success
  end

  test "should update sample" do
    patch :update, id: @sample, sample: { date: @sample.date, is_bottom: @sample.is_bottom, notes: @sample.notes, 
      physical_appearance: @sample.physical_appearance, recreational_suitability: @sample.recreational_suitability, 
      secchi_depth: @sample.secchi_depth, time: @sample.time, water_color: @sample.water_color, 
      lake_id: @sample.lake_id, citizen_id: @sample.citizen_id }
    assert_redirected_to sample_path(assigns(:sample))
  end

  test "should destroy sample" do
    assert_difference('Sample.count', -1) do
      delete :destroy, id: @sample
    end

    assert_redirected_to samples_path
  end
end
