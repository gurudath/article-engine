class BaseArticlesController < ApplicationController
  before_action :set_base_article, only: [:show, :edit, :update, :destroy]
  layout "article_application"
  # GET /base_articles
  def index
    @base_articles = BaseArticle.paginate(:page => params[:page], :per_page => 2,:order=>"id DESC")
    if !params[:page].blank?
     render :template=>"/base_articles/index",:layout =>false
    else
     render :template=>"/base_articles/index"
    end 
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
      redirect_to action:"index", notice: 'Base article was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /base_articles/1
  def update
    if @base_article.update(base_article_params)
      redirect_to action:"index",notice: 'Base article was successfully updated.'
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
      debugger
      @base_article = BaseArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def base_article_params
      params.require(:base_article).permit(:title, :content,:medium,:description,:base_article_image)
    end
end
