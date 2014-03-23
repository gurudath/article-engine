require 'test_helper'

class BaseArticlesControllerTest < ActionController::TestCase
  setup do
    @base_article = base_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_article" do
    assert_difference('BaseArticle.count') do
      post :create, base_article: { content: @base_article.content, title: @base_article.title }
    end

    assert_redirected_to base_article_path(assigns(:base_article))
  end

  test "should show base_article" do
    get :show, id: @base_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @base_article
    assert_response :success
  end

  test "should update base_article" do
    patch :update, id: @base_article, base_article: { content: @base_article.content, title: @base_article.title }
    assert_redirected_to base_article_path(assigns(:base_article))
  end

  test "should destroy base_article" do
    assert_difference('BaseArticle.count', -1) do
      delete :destroy, id: @base_article
    end

    assert_redirected_to base_articles_path
  end
end
