class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        spices = Spice.all
        render json: spices
    end
    def show
        spice = find_spice
        render json: spice
    end
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end
    
      def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
      end
    
      private
    
      def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
      end
      def find_spice
        Spice.find(params[:id])
      end
      def render_not_found_response
        render json: { error: "202 not found" }, status: :not_found
  end
end