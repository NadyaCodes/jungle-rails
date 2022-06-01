class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def index
    @categories = Category.order(id: :desc).all
  end
  def show
    @categories = Category.order(id: :desc).all
  end
end
