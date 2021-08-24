class PostsController < ApplicationController
    def new
      # id: nil, caption: nil, user_id: nil, created_at: nil, updated_at: nil
      # newとbuildに違いはないが、モデルを関連付けする際にはbuildを使う
    @post = Post.new
    @post.photos.build
    end

    def create
    @post = Post.new(post_params)
    #nilまたは空のオブジェクト（例えば空の配列）でなければtrueを返す
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end
#privateは外部から呼び出せない
  private
  #post_paramsというメソッドを引数で呼び出している
  # merge 誰が投稿したかという情報が必要なためuser_idの情報を統合している
    def post_params
      params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
    end
  end
