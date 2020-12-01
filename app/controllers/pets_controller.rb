class PetsController < ApplicationController
  def index
    @pets = Pet.all.order(:name)
    render json: {ok: 'YUP'}, status: :ok
  end
end
