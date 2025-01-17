class QuestionsController < ApplicationController
  before_action :authenticate_user! # Deviseで提供されるメソッド
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    # 解答済みの問題数
    @answered_count = UserAnswer.where(user: current_user).count
    # 全体の問題数
    @total_questions = Question.count
  end
  
  def next
    answered_question_ids = UserAnswer.where(user: current_user).pluck(:question_id)
    @question = Question.where.not(id: answered_question_ids).order("RANDOM()").first
    
    if @question
      redirect_to question_path(@question)
    else
      flash[:notice] = "以上で終了になります"
      #redirect_to root_path
      redirect_to result_questions_path
    end
  end
  
  
  def answer
    @question = Question.find(params[:id])
    user_answer = params[:user_answer] # ○ または ×

  # 正解判定
    @correct = @question.correct_answer == user_answer

  # 解答を保存または更新
    @user_answer = UserAnswer.find_or_initialize_by(user: current_user, question: @question)
    @user_answer.correct = @correct
    @user_answer.user_answer = user_answer # ユーザーの選択を保存
    #@user_answer.answered_at = Time.current # 回答日時を保存
    @user_answer.save

  # 解答結果画面を表示
    render "questions/answer_result"
  end
  
  def result
    @correct_count = UserAnswer.where(user: current_user, correct: true).count
    @incorrect_count = UserAnswer.where(user: current_user, correct: false).count
    @total_questions = Question.count
  end
end
