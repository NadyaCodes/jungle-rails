require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create new product' do
      @product = Product.new(:name => "begonia", :price_cents => 1299, :quantity => 3, :category_id => 2)
      expect(@product).to be_present
    end

    it 'should require name' do
      @product = Product.new(:name => nil, :price_cents => 1299, :quantity => 3, :category_id => 2)
      @product.validate 
      expect(@product.errors[:name]).to include("can't be blank") # check for presence of error
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require price' do
      @product = Product.new(:name => "begonia", :price_cents => nil, :quantity => 3, :category_id => 2)
      @product.validate 
      expect(@product.errors[:price]).to include("can't be blank")
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should require quantity' do
      @product = Product.new(:name => "begonia", :price_cents => 1299, :quantity => nil, :category_id => 2)
      @product.validate 
      expect(@product.errors[:quantity]).to include("can't be blank")
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should require category' do
      @product = Product.new(:name => "begonia", :price_cents => 1299, :quantity => 3, :category_id => nil)
      @product.validate 
      expect(@product.errors[:category]).to include("can't be blank")
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
