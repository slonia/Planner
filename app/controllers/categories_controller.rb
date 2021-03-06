class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  before_filter :authenticate_user!
  def index
    @categories = Category.find_all_by_user_id(current_user.id)
    @notes=[];
    @categories.each do |cat|
      @notes+=Note.find_all_by_category_id(cat.id)
    end
    @category = Category.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @notes = Note.find_all_by_category_id(@category.id)
    @categories = Category.find_all_by_user_id(current_user.id)
    respond_to do |format|
      format.js
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      @category.save
      @categories = Category.find_all_by_user_id(current_user.id)
      format.js
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    @categories = Category.find_all_by_user_id(current_user.id)
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.js {render action: 'create'}
      format.json { head :no_content }
    end
  end
end
