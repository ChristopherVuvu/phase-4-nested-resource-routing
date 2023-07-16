class ItemsController < ApplicationController
    before_action :set_dog_house, only: [:index, :show, :create]
    
    def index
        items = @dog_house.items
        render json: items
    end
    
    def show
        item = @dog_house.items.find(params[:id])
        render json: item
    end
    
    def create
        item = @dog_house.items.create(item_params)
        render json: item, status: :created
    end
    
    private
    
    def set_dog_house
        @dog_house = DogHouse.find(params[:dog_house_id])
    end
    
    def item_params
        params.require(:item).permit(:name, :description, :price)
    end
end
