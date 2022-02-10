class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])  
  end


  def edit
    @book=Book.find(params[:id])
  end
  
  
  def update
     @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = 'Book was successfully updated'
     redirect_to book_path(@book.id)
   else
     render :edit
   end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
     # １. データを新規登録するための変数作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = 'Book was successfully updated'
    # ３. トップ画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end
    
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
   
end

