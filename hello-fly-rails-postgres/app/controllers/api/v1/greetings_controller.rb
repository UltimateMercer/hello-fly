module Api
  module V1
    class GreetingsController < ApplicationController
      before_action :set_greeting, only: [:show, :update, :destroy]

      # GET /api/v1/greetings
      def index
        @greetings = Greeting.recent.page(params[:page]).per(params[:per_page] || 10)

        render json: {
          greetings: @greetings,
          meta: {
            total_count: Greeting.count,
            page: params[:page] || 1,
            per_page: params[:per_page] || 10
          }
        }
      end

      # GET /api/v1/greetings/:id
      def show
        render json: @greeting
      end

      # POST /api/v1/greetings
      def create
        @greeting = Greeting.new(greeting_params)

        if @greeting.save
          render json: @greeting, status: :created
        else
          render json: { errors: @greeting.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/greetings/:id
      def update
        if @greeting.update(greeting_params)
          render json: @greeting
        else
          render json: { errors: @greeting.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/greetings/:id
      def destroy
        @greeting.destroy
        head :no_content
      end

      private

      def set_greeting
        @greeting = Greeting.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Greeting not found' }, status: :not_found
      end

      def greeting_params
        params.require(:greeting).permit(:message, :name)
      end
    end
  end
end
