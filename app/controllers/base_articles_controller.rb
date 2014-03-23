class BaseArticlesController < ApplicationController
  before_action :set_base_article, only: [:show, :edit, :update, :destroy]

  # GET /base_articles
  def index
    @base_articles = BaseArticle.all
  end

  # GET /base_articles/1
  def show
  end

  # GET /base_articles/new
  def new
    @base_article = BaseArticle.new
  end

  # GET /base_articles/1/edit
  def edit
  end

  # POST /base_articles
  def create
    @base_article = BaseArticle.new(base_article_params)

    if @base_article.save
      redirect_to @base_article, notice: 'Base article was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /base_articles/1
  def update
    if @base_article.update(base_article_params)
      redirect_to @base_article, notice: 'Base article was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /base_articles/1
  def destroy
    @base_article.destroy
    redirect_to base_articles_url, notice: 'Base article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_article
      @base_article = BaseArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def base_article_params
      params.require(:base_article).permit(:title, :content)
    end
end
