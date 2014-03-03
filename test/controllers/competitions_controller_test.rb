require 'test_helper'

class CompetitionsControllerTest < ActionController::TestCase
  setup do
    @competition = competitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:competitions)
  end

  test "should create competition" do
    assert_difference('Competition.count') do
      post :create, competition: { end_time: @competition.end_time, name: @competition.name, start_time: @competition.start_time, team: @competition.team }
    end

    assert_response 201
  end

  test "should show competition" do
    get :show, id: @competition
    assert_response :success
  end

  test "should update competition" do
    put :update, id: @competition, competition: { end_time: @competition.end_time, name: @competition.name, start_time: @competition.start_time, team: @competition.team }
    assert_response 204
  end

  test "should destroy competition" do
    assert_difference('Competition.count', -1) do
      delete :destroy, id: @competition
    end

    assert_response 204
  end
end
