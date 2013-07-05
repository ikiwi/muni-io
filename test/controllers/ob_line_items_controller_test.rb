require 'test_helper'

class ObLineItemsControllerTest < ActionController::TestCase
  setup do
    @ob_line_item = ob_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ob_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ob_line_item" do
    assert_difference('ObLineItem.count') do
      post :create, ob_line_item: { direction_id: @ob_line_item.direction_id, route_id: @ob_line_item.route_id, stop_id: @ob_line_item.stop_id }
    end

    assert_redirected_to ob_line_item_path(assigns(:ob_line_item))
  end

  test "should show ob_line_item" do
    get :show, id: @ob_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ob_line_item
    assert_response :success
  end

  test "should update ob_line_item" do
    patch :update, id: @ob_line_item, ob_line_item: { direction_id: @ob_line_item.direction_id, route_id: @ob_line_item.route_id, stop_id: @ob_line_item.stop_id }
    assert_redirected_to ob_line_item_path(assigns(:ob_line_item))
  end

  test "should destroy ob_line_item" do
    assert_difference('ObLineItem.count', -1) do
      delete :destroy, id: @ob_line_item
    end

    assert_redirected_to ob_line_items_path
  end
end
