require 'test_helper'

class ActivityStatesControllerTest < ActionController::TestCase
  setup do
    @activity_state = activity_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_state" do
    assert_difference('ActivityState.count') do
      post :create, activity_state: { name: @activity_state.name }
    end

    assert_redirected_to activity_state_path(assigns(:activity_state))
  end

  test "should show activity_state" do
    get :show, id: @activity_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_state
    assert_response :success
  end

  test "should update activity_state" do
    patch :update, id: @activity_state, activity_state: { name: @activity_state.name }
    assert_redirected_to activity_state_path(assigns(:activity_state))
  end

  test "should destroy activity_state" do
    assert_difference('ActivityState.count', -1) do
      delete :destroy, id: @activity_state
    end

    assert_redirected_to activity_states_path
  end
end
