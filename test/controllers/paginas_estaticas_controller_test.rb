require 'test_helper'

class PaginasEstaticasControllerTest < ActionController::TestCase
  test "should get inicio" do
    get :inicio
    assert_response :success
  end

  test "should get ayuda" do
    get :ayuda
    assert_response :success
  end

  test "should get acercade" do
    get :acercade
    assert_response :success
  end

end
