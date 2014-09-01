class AdminsController < ApplicationController
  def index
  end

  def new    
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      gflash :success => "Admin's Profile has been created successfully!"
      redirect_to @admin
    else
      gflash :now, :error => "Something went wrong."
    end    
  end

  private
  def admin_params   
    params.require(:admin).permit(:name)
  end
end
