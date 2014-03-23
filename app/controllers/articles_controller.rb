class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = BaseArticle.paginate(:page => params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = BaseArticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = BaseArticle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = BaseArticle.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = BaseArticle.new(params[:article].permit(:name,:description,:content))

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        redirect_to :action=>index
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = BaseArticle.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = BaseArticle.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def search
   if params[:search]
    @articles =  BaseArticle.article_search(params[:search],params[:page],params[:per_page]).results
    @results = BaseArticle.article_search(params[:search],params[:page],params[:per_page]) 
     render :template=>"articles/search"
   else
     redirect_to :action=>:index
   end 
  end
end
