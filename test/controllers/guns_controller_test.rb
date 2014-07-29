require 'test_helper'

class GunsControllerTest < ActionController::TestCase
  setup do
    @gun = guns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gun" do
    assert_difference('Gun.count') do
      post :create, gun: { model: @gun.model, type: @gun.type }
    end

    assert_redirected_to gun_path(assigns(:gun))
  end

  test "should show gun" do
    get :show, id: @gun
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gun
    assert_response :success
  end

  test "should update gun" do
    patch :update, id: @gun, gun: { model: @gun.model, type: @gun.type }
    assert_redirected_to gun_path(assigns(:gun))
  end

  test "should destroy gun" do
    assert_difference('Gun.count', -1) do
      delete :destroy, id: @gun
    end

    assert_redirected_to guns_path
  end
end
