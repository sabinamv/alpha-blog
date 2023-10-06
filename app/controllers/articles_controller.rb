class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] #where is method used

  def show
  end

  def index

    @articles = Article.all

  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params) #simply call method from private
    if @article.save
      redirect_to @article
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #without end block (should always be to the bottom)

  #method for getting and ID
  def set_article
  @article = Article.find(params[:id])
  end

  #method for params
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
