class MobileAppsController < ApplicationController
  def index
    @title = "List of all mobile application" 
    @mobile_apps = MobileApp.all.page(params[:page]).per(3)
  end

  def new
    @mobile_app = MobileApp.new    
  end
 
  def create
    @mobile_app = MobileApp.create(mobile_app_params)
    if @mobile_app.save
      gflash :success => "MobileApplication has been created successfully!"
      redirect_to @mobile_app
    else
       gflash :error => "Something went wrong."
      render 'new'
    end
  end

  def show
    @mobile_app = MobileApp.friendly.find(params[:id])
  end

  def edit
    @mobile_app = MobileApp.friendly.find(params[:id])
  end

  def update
    @mobile_app = MobileApp.friendly.find(params[:id])
    if @mobile_app.update(mobile_app_params)      
      gflash :success => "MobileApplication has been updated successfully!"
      redirect_to @mobile_app
    else       
      gflash :now, :error => "Something went wrong."
      render 'edit'
    end
  end

  def destroy
    @mobile_app = MobileApp.friendly.find(params[:id])
    @mobile_app.destroy
    redirect_to mobile_apps_path    
  end

  private
  def mobile_app_params
   params.require(:mobile_app).permit(:name,:email,:Selling_Price,:Category,:Android_App_URL,:Long_Description,:photo)
  end
end
