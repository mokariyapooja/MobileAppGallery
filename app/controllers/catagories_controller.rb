class CatagoriesController < ApplicationController
   def index
    @title = "Catagories" 
    @catagories = Catagory.all.page(params[:page]).per(1)
  end

  def new
    @catagory = Catagory.new    
  end

  def create
    
    @catagory = Catagory.create(catagory_params)
    if @catagory.save
       gflash :success => "Catagory has been created successfully!"
      redirect_to @catagory
    else
       gflash :now, :error => "Something went wrong."
      render 'new'
    end
  end

  def show
    @catagory = Catagory.friendly.find(params[:id])
  end

  def edit
    @catagory = Catagory.friendly.find(params[:id])
  end

  def update
    @catagory = Catagory.friendly.find(params[:id])
    if @catagory.update(catagory_params)
      gflash :success => "Catagory has been updated successfully!"
      redirect_to @catagory
    else
      gflash :now, :error => "Something went wrong."
      render 'edit'
    end
  end

  def destroy
    @catagory = Catagory.friendly.find(params[:id])
    @catagory.destroy
    redirect_to mobile_apps_path    
  end

  #to search user from list
  def search
    @catagories = Catagory.search(params[:search]).page(params[:page]).per(1)
    render 'index'
  end

  private
  def catagory_params
   params.require(:catagory).permit(:name )
  end
end
