class PetsController < ApplicationController
  def index
    pets = Pet.all.order(:name)
    render json: pets.as_json(only: [:id, :name, :age, :owner, :species]),
           status: :ok
  end
end
