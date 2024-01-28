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
  end

  def edit
  end

  def create
    @q = Menu.ransack(params[:q])
    @menu = current_user.menus.new(menu_params)

      if @menu.save
        redirect_to menus_path, notice: "Menu was successfully created."
      else
        render :new
      end
  end

  def update
    @q = Menu.ransack(params[:q])
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully updated." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :material, :make, :point, :menu_image, :menu_image_cache)
    end
end
