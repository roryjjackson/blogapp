class ArticlesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @category = Category.find(params[:category_id])
    @article.user_id = current_user.id
    @article.category_id = @category.id
    if @article.save
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @category = Category.find(params[:category_id])
    if params[:query].present?
      sql_query = <<~SQL
        articles.content ILKE :query
        OR articles.summary ILIKE :query
        OR articles.title ILIKE :query
        OR category.title ILIKE :query
        OR category.content ILIKE :query
      SQL
      @articles = Article.joins(:category).where(sql_query, query: "%#{ params[:query]}%")
    else
      @articles = Article.all
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to category_path(@category)
  end

  def destroy
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
    @article.destroy
    redirect_to category_path(@category)
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :meta_title, :summary, :content, :slug, photos: [])
  end
end
