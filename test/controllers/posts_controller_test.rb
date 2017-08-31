require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index2" do
    get :index2
    assert_response :success
  end

  test "should get index3" do
    get :index3
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get searchindex" do
    get :searchindex
    assert_response :success
  end

end
