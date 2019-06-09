class TopController < ApplicationController
  def index
    # user_idがcurrent_user（現在ログインしているユーザー）のレコードを取得
    @lists = List.where(user: current_user).order("created_at ASC")
  end
end
