class ProductsController < ApplicationController
    
      # GET /products/:id
    def index
        products = Product.all
        render json: products
    end 

    def create
        new_product = Product.create(product_params)
        render json: new_product , status: :created
    end

    def update
        product = Product.find_by(id: params[:id])
        product.update(product_params)
        render json: product
    end

    def destroy
        product = Product.find_by(id: params[:id])
        product.destroy
        head :no_content
    end

    private

    def product_params
        params.permit(:name, :price, :description)
    end
end
