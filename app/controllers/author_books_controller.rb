class AuthorBooksController < ApplicationController
  before_action :set_author_book, only: [:show, :update, :destroy]

  # GET /author_books
  def index
    @author_books = AuthorBook.all

    render json: @author_books
  end

  # GET /author_books/1
  def show
    render json: @author_book
  end

  # POST /author_books
  def create
    @author_book = AuthorBook.new(author_book_params)

    if @author_book.save
      render json: @author_book, status: :created, location: @author_book
    else
      render json: @author_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /author_books/1
  def update
    if @author_book.update(author_book_params)
      render json: @author_book
    else
      render json: @author_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /author_books/1
  def destroy
    @author_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_book
      @author_book = AuthorBook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_book_params
      params.require(:author_book).permit(:author_id, :book_id)
    end
end
