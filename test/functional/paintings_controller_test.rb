require 'test_helper'

class PaintingsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:paintings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_painting
    assert_difference('Painting.count') do
      post :create, :painting => { }
    end

    assert_redirected_to painting_path(assigns(:painting))
  end

  def test_should_show_painting
    get :show, :id => paintings(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => paintings(:one).id
    assert_response :success
  end

  def test_should_update_painting
    put :update, :id => paintings(:one).id, :painting => { }
    assert_redirected_to painting_path(assigns(:painting))
  end

  def test_should_destroy_painting
    assert_difference('Painting.count', -1) do
      delete :destroy, :id => paintings(:one).id
    end

    assert_redirected_to paintings_path
  end
end
