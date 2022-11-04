class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @category = Category.find(params[:category_id])
    @comment = Comment.new
  end

  def create
    @category = Category.find(params[:category_id])
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article_id = @article.id
    @comment.user_id = current_user.id
    @comment.category_id = @category.id
    if @comment.save
      # raise
      redirect_to category_article_path(@category, @article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @comments = Comment.all
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.article_id = @article.id
    @comment.user_id = current_user.id
    @comment.category_id = @category.id
    @comment.update(comment_params)
    redirect_to category_article_path(@category, @article)
    # raise
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to category_article_comment_path(@comment.article_id)
    # raise
  end

  def show
    # raise
    # @category = Category.find(params[:category_id])
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end
