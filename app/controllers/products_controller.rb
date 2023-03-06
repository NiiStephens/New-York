class ProductsController < ApplicationController
    
      # GET /products
        
    def index
        products = Product.all
        render json: products
    end 

        #GET /products/1

    def show
        single_product = Plant.find_by(id: params[:id])
        render json: single_product
    end

        # POST /products
    def create
        new_product = Product.create(product_params)
            if @product.save
                render json: new_product, status: :created
            else 
                render json: @product.errors, status: :not_found
            end
    end

    def update
        if @product.update(product_params)
           render json: @product
        else
            render json: @product.errors, status: :not_found 
    end

    def destroy
        product = Product.find_by(id: params[:id])
        product.destroy
        head :no_content
    end

    private

    def product_params
        params.permit(:id, :name, :price, :description)
    end
end
