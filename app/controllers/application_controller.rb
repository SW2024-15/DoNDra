class ApplicationController < ActionController::Base
  # ログイン後の遷移先を設定
  def after_sign_in_path_for(resource)
    top_path  # TOP画面にリダイレクト
  end
end
