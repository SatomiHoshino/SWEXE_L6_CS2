class CartItemsController < ApplicationController
    
    
    def new
        @cartitem = CartItem.new
    end
    
    def create
        
        if @cart_item.blank?
            @cart_item = current_cart.cart_items.build(product_id: params[:product_id])
        end

        @cart_item.quantity += params[:quantity].to_i
        @cart_item.save
        redirect_to cart_show_path

        #ty = params[:cartitem][:qty]
        #product_id = params[:cartitem][:product_id]
        #cart_id = params[:cartitem][:cart_id]
        #@cartitem = CartItem.new(qty: qty, product_id: product_id, cart_id: cart_id)
        #if @cartitem.save
        #    if my_cart.add_item(product_id: params[:product_id], qty: params[:qty])
        #       flash[:notice] = '商品が追加されました'
        #       redirect_to cart_show_path
        #    else
        #        flash[:notice] = '商品の追加に失敗しました'
        #       render 'new'
        #    end
        #end
    end
    
    def destroy
        cartitem = CartItem.find(params[:id])
        cartitem.destroy
        flash[:notice] = 'カート内の商品が削除されました'
        redirect_to root_path
    end
    
private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :price, :quantity)
    end
    
end
