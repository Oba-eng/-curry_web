class Mypage::TreeController < ApplicationController

  def index
    @q = Menu.ransack(params[:q])

    @menus = Menu.all

    respond_to do |format|
      format.html
    end
  end

   # 他のアクションとは異なる名前で新しいアクションを追加
   def get_menu_details
    node_id = params[:node_id]
    @menu = Menu.find_by(node_id: node_id)
    # @menuを使用して必要な処理を実行
    # 例: クリックされたノードに関連するメニューの情報を返す
    render json: { menu_details: @menu.details }
  end

end
