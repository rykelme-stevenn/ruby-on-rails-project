class PostsController < ApplicationController
    def index
        # Criar um index e um variável que traga os registros de posts em forma decrescente
        # em relação à data de criação
        @posts = Post.order(created_at: :desc)

        # rendererizar(retornar) a resposta em json
        render json: @posts
    end

    def show
        @post = Post.find params[:id]

        render json: @post
    end

    def create
        @post = Post.new post_params #parametros

        if(@post.save)
            render json: @post, status: :created
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def update
        @post = Post.find params[:id]

        if(@post.update post_params)
            render json: @post
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find params[:id]
        @post.destroy

        head :ok
    end


    private

    def post_params
        # Vai dizer quais parametros devem ser alterados, quaisquer outros serão ignorados
        params.permit(:title, :content, :author)
    end
end
