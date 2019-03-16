module Api
  module V1
    class AuthorsController < ApplicationController

      before_action :set_author, only: [:show, :update, :destroy]

      def index
        @authors = Author.order( 'created_at DESC' )
        respond @authors, 0, 'Authors loaded', :ok
      end

      def show
        respond @author, 0, 'Author loaded', :ok
      end

      def create
        @author = Author.new( author_params )
        if @author.save
          respond @author, 0, 'New author created', :created
        else
          respond @author.errors, 1, 'Could not create author', :unprocesable_entity
        end
      end

      def destroy
        @author.destroy
        respond @author, 0, "Author destroyed", :ok
      end

      def update
        if @author.update_attributes( author_params )
          respond @author, 0, "Author updated", :ok
        else
          respond @author.errors, 1, "Author not updated", :ok
        end
      end

      private

      def author_params
        params.permit( :title, :body )
      end

      def set_author
        begin
          @author = author.find( params[ :id ] )
        rescue => e
          respond e, 1, "Could not locate resource."
        end
      end

    end
  end
end
