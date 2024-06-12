class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: %i[index show]

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
    @menu.material = [''] if @menu.material.blank? # 空の要素を1つ追加して初期化
    @menu.quantity = [''] if @menu.quantity.blank? # 空の要素を1つ追加して初期化
    @menu.make = [''] if @menu.make.blank? # 空の要素を1つ追加して初期化
  end

  def edit
    @menu = Menu.find(params[:id])
    @q = Menu.ransack(params[:q])
  end

  def create
    @q = Menu.ransack(params[:q])
    @menu = current_user.menus.new(menu_params)

    if params[:back]
      render :new
    elsif @menu.save
      redirect_to @menu, success: '投稿しました'
    else
      render :new
    end
  end

  def update
    @q = Menu.ransack(params[:q])
    if @menu.update(menu_params)
      redirect_to menu_url(@menu), success: '更新しました'
    else
      render :edit
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
  
    if !@menu.menu_image.present?
      @menu.menu_image.retrieve_from_cache!(session[:menu_image_cache])
    end
  
    if @menu.valid?
      session[:menu] = @menu.attributes
      session[:menu_image_cache] = @menu.menu_image.cache_name
      render :confirm_new
    else
      render :new
    end
  end
  

  def back
    @q = Menu.ransack(params[:q])
    @menu = Menu.new(session[:menu]) if session[:menu]
    render :new
  end

  def search
    @menus = Menu.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
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
