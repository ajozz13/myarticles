module Api
  module V1
    class ArticlesController < ApplicationController

      before_action :set_article, only: [:show, :update, :destroy]

      def index
        @articles = Article.order( 'created_at DESC' )
        respond @articles, 0, 'Articles loaded', :ok
      end

      def show
        respond @article, 0, 'Article loaded', :ok
        #render :json => @article.to_json( :include => { :author => { :only => :name } } )
        #render json: @article.to_json( { include: { author: { only: :name } } } )
      end

      def create
        @article = Article.new( article_params )
        if @article.save
          respond @article, 0, 'New Article Created', :created
        else
          respond @article.errors, 1, 'Could not create article', :unprocesable_entity
        end
      end

      def destroy
        @article.destroy
        respond @article, 0, "Article destroyed", :ok
      end

      def update
        if @article.update_attributes( article_params )
          respond @article, 0, "Article updated", :ok
        else
          respond @article.errors, 1, "Article not updated", :ok
        end
      end

      private

      def article_params
        params.permit( :title, :body )
      end

      def set_article
        begin
          #@article = Article.find( params[ :id ] )
          @article = Article.joins( :author )
            .select( 'articles.id, articles.title, articles.body, authors.name as author_name' )
            .where( id: params[ :id ] )
        rescue => e
          respond e, 1, "Could not locate resource."
        end
      end

    end
  end
end
