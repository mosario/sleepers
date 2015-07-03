class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "demo", password: "demo", except: [:index, :show]

	add_breadcrumb "Главная", :root_path, :options => { :title => "Назад" }

	def index
		@articles = Article.all
		add_breadcrumb "Список", @articles_path
	end

	def show
		@article = Article.find(params[:id])

		add_breadcrumb "Список", articles_path
		add_breadcrumb "Детальная", @articles_path
	end

	def new
		@article = Article.new

		add_breadcrumb "Список", articles_path
		add_breadcrumb "Создать", @articles_path
	end

	def edit
		@article = Article.find(params[:id])

		add_breadcrumb "Список", articles_path
		add_breadcrumb "Редактирование", @articles_path
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to article_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
