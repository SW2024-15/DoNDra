class TopController < ApplicationController
    def main
        if user_signed_in?
            render "main"
        else
            render "login"
        end
    end
    
    def login
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
            sign_in user  # Deviseのログイン処理
            redirect_to top_main_path
        else
            render "error", status: 422
        end
    end
    
    def logout
        sign_out current_user
        redirect_to root_path
    end

    # 新しいアクションを追加
    def about
        render "about"
    end
end

