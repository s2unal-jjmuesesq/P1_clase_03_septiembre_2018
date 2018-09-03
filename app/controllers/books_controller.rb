class BooksController < ApplicationController
    def index
        #render 'Hello World'
        books = Book.all
        respond_to do |format|
    
        #format.json {render json: "{\"name\":\"Jhon\"}", status:200}
        format.html {render html: books, status:200}
        format.json {render json: books, status:200}
        #format.xml {render xml:}
        end
    end
    
    def show
        book = Book.find(params[:id])
        respond_to do |format|
    
        format.json {render json: books, status:200}
        
    end
    
    
    def create
        book = Book.new(params_book)
        if book.save
            respond_to do |format|
    
            #format.html {render html: books, status:200}
                format.json {render json: books, status:201}
            end
        else
            respond_to do |format|
                format.json {render json: books.errors, status:200}
            end
        end
    
    def params_book
        params.permit(:name, :year, :code, :avaliable)#
    end
    end
end