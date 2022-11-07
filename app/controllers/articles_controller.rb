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

  # def create
  #   @flat = Flat.new(flat_params)

  #   respond_to do |format|
  #     if @flat.save
  #       format.html { redirect_to flat_url(@flat), notice: "Flat was successfully created." }
  #       format.json { render :show, status: :created, location: @flat }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @flat.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def index
    # @articles = Article.all
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
    # @markers = @articles.geocoded.map do |article| {
    #   lat: article.latitude,
    #   lng: article.longitude,
    #   # info_window: render_to_string(partial: "info_window", locals: {article: article}),
    #   # image_url: helpers.asset_url("https://raw.githubusercontent.com/lewagon/fullstack-images/master/logo.png")
    # }
    # end
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
    # @articles = Article.all
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article)
    # @markers = @article.geocoded.map do |article| {
    #   lat: article.latitude,
    #   lng: article.longitude,
    #   # info_window: render_to_string(partial: "info_window", locals: {article: article}),
    #   # image_url: helpers.asset_url("https://raw.githubusercontent.com/lewagon/fullstack-images/master/logo.png")
    # }
    # end
  end

  private

  def article_params
    params.require(:article).permit(:title, :meta_title, :summary, :content, :slug, photos: [])
  end
end
