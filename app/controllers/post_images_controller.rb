class PostImagesController < ApplicationController
  def new
    @post_images = PostImages.all
    @post_images = PostImages.new
  end
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  def index
    @post_images = PostImages.all
  end

  def show
    @post_images = PostImages.all
  end

  def edit
  end
  # 投稿データのストロングパラメータ
  def destroy
    post_image = 削除するPostImageレコードを取得
    post_image.削除
    redirect_to PostImageの一覧ページへのパス
  end
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
