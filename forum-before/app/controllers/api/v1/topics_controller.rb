module Api
  module V1
    class TopicsController < ApplicationController
      respond_to :json

      def index
        respond_with Topic.order("sticky desc")
      end

      def show
        respond_with Topic.find(params[:id])
      end

      def create
        respond_with Topic.create(params[:topic])
      end

      def update
        respond_with Topic.update(params[:id], params[:topic])
      end

      def destroy
        respond_with Topic.destroy(params[:id])
      end
    end
  end
end
