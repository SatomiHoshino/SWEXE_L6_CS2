class ProductsController < ApplicationController
    def index
        @product = Product.all
        @cart = Cart.all
    end
    
    def new
        @product = Product.new
    end
    
    def create
        name = params[:product][:name]
        price = params[:product][:price]
        @product = Product.new(name: name, price: price)
        if @product.save
           flash[:notice] = '[１メッセージ追加しました]'
           redirect_to root_path
        else
           render 'new'
        end
    end
    
    def destroy
        product = Product.find(params[:id])
        product.destroy
        redirect_to root_path
    end
end
