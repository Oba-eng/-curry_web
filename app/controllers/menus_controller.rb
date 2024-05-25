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
    
    if params[:back].present?
      render :new
      return
    end
  
    if @menu.save
      redirect_to menus_path, success: '保存しました'
    else
      render :new
    end
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
  end
  

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :genre, :hot, :point, :menu_image, make: [], material: [], quantity: [])
    end
end
