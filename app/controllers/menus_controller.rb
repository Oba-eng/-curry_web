class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: %i[index]

  def index
    @menus = Menu.all
    @q = Menu.ransack(params[:q])
    @menus = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
  end

  def show
    @q = Menu.ransack(params[:q])
  end

  def new
    @menu = Menu.new
    @q = Menu.ransack(params[:q])
    
    if session[:menu_params]
      @menu.attributes = session[:menu_params]
      @menu.material = session[:menu_params][:material] || ['']
      @menu.quantity = session[:menu_params][:quantity] || ['']
      @menu.make = session[:menu_params][:make] || ['']
      session.delete(:menu_params)
    else
      @menu.material = [''] if @menu.material.blank?
      @menu.quantity = [''] if @menu.quantity.blank? 
      @menu.make = [''] if @menu.make.blank? 
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    @q = Menu.ransack(params[:q])
  end

  def create
    @q = Menu.ransack(params[:q])
    @menu = current_user.menus.new(menu_params)
    
    if params[:back]
      session[:menu_params] = menu_params
      redirect_to new_menu_path and return
    end
    
    unless @menu.save
      render :new and return
    end
  
    redirect_to @menu, notice: 'Menu was successfully created.'
  end

  def update
    @q = Menu.ransack(params[:q])
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menu_url(@menu), success: '更新しました' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_url, success: '削除しました'
  end

  def favorites
    @favorites_menus = current_user.favorite_menus.includes(:user).order(created_at: :desc)
  end

  def confirm_new
    @q = Menu.ransack(params[:q])
    @menu = current_user.menus.new(menu_params)
  
    if @menu.valid?
      render :confirm_new
    else
      render :new
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :genre, :hot, :point, :menu_image, :menu_image_cache, material: [], quantity: [], make: [])
    end
end
