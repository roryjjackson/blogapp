class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article_id = @article.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @comments = Comment.all
  end

  def edit
    @article = Article.find(params[:id])
    @comment = Comment.find(params[:article_id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:article_id])
    @comment.destroy
    redirect_to article_comment_path(@comment.article_id)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end
