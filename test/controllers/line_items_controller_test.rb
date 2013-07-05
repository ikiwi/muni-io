require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @ib_line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ib_line_item" do
    assert_difference('LineItem.count') do
      post :create, ib_line_item: { direction_id: @ib_line_item.direction_id, route_id: @ib_line_item.route_id, stop_id: @ib_line_item.stop_id }
    end

    assert_redirected_to line_item_path(assigns(:ib_line_item))
  end

  test "should show ib_line_item" do
    get :show, id: @ib_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ib_line_item
    assert_response :success
  end

  test "should update ib_line_item" do
    patch :update, id: @ib_line_item, ib_line_item: { direction_id: @ib_line_item.direction_id, route_id: @ib_line_item.route_id, stop_id: @ib_line_item.stop_id }
    assert_redirected_to line_item_path(assigns(:ib_line_item))
  end

  test "should destroy ib_line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @ib_line_item
    end

    assert_redirected_to line_items_path
  end
end
