class AltsController < ApplicationController
  before_action :set_alt, only: [:show, :update, :destroy]

  # GET /alts
  def index
    @alts = Alt.all

    render json: @alts
  end

  # GET /alts/1
  def show
    render json: @alt
  end

  # POST /alts
  def create
    @book = Book.find_by(title: alt_params[:title]).destroy
    @alt = Alt.new(alt_params)

    if @alt.save
      render json: @alt, status: :created, location: @alt
    else
      render json: @alt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alts/1
  def update
    if @alt.update(alt_params)
      render json: @alt
    else
      render json: @alt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alts/1
  def destroy
    @alt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alt
      @alt = Alt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alt_params
      params.require(:alt).permit(:title, :book_id)
    end
end
