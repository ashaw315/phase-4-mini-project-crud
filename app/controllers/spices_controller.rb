class SpicesController < ApplicationController
    
    # GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    # def show
    #     spice = Spice.find_by(id: params[:id])
    #     if spice
    #         render json: spice
    #     else
    #         render json: { error: "Spice not found"}, status: :not_found
    #     end
    # end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        if spice
            spice.update(spice_params)
            render json: spice, status: :created
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    private 

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
