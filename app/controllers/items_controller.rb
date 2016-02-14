class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.save #うえで入れた情報をsaveメソッドで処理 DBに登録される
        redirect_to @item #createはviewがないのでリダイレクト処理を行う
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id]) #更新かける前に情報を取得
        @item.update(item_params) #25行目で狙いを定めて、updateをかけるよ、内容はitem_paramsだよ
        redirect_to @item
    end

    private
    def item_params
        params.require(:item).permit(:name, :description, :price, :seller_id, :email, :image_url)
    end

end
