class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  before_action :set_books, only: [:convert_to_alt]

  # GET /books
  def index
    @books = Book.all

    render json: @books.sort_by{ |book| book.title }
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT books/1/convert_to_alt/2
  def convert_to_alt
    alt = @book.convert_to_alt(@reference_book)
    @books = Book.all

    if alt
      render json: @books.sort_by{ |book| book.title }, status: :accepted
    else
      render json: alt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_books
      @book = Book.find(params[:id])
      @reference_book = Book.find(params[:reference_book_id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title)
    end
end
