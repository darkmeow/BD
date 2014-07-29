require 'test_helper'

class CasosControllerTest < ActionController::TestCase
  setup do
    @caso = casos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caso" do
    assert_difference('Caso.count') do
      post :create, caso: { casename: @caso.casename, date_occu: @caso.date_occu, desc: @caso.desc, place_occu: @caso.place_occu, status: @caso.status, user_id: @caso.user_id, victname: @caso.victname }
    end

    assert_redirected_to caso_path(assigns(:caso))
  end

  test "should show caso" do
    get :show, id: @caso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caso
    assert_response :success
  end

  test "should update caso" do
    patch :update, id: @caso, caso: { casename: @caso.casename, date_occu: @caso.date_occu, desc: @caso.desc, place_occu: @caso.place_occu, status: @caso.status, user_id: @caso.user_id, victname: @caso.victname }
    assert_redirected_to caso_path(assigns(:caso))
  end

  test "should destroy caso" do
    assert_difference('Caso.count', -1) do
      delete :destroy, id: @caso
    end

    assert_redirected_to casos_path
  end
end
