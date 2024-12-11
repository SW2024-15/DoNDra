class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def next
    @question = Question.order("RANDOM()").first
    if @question
      redirect_to question_path(@question) # showページへ
    else
      flash[:notice] = "問題がありません"
      redirect_to questions_path
    end
  end
  
  
  def answer
    @question = Question.find(params[:id])
    user_answer = params[:user_answer] # ○ または ×

    # 正解判定: DBに保存されている正解と比較
    correct = @question.correct_answer == user_answer

    # ユーザーの解答を記録
    UserAnswer.create(user: current_user, question: @question, correct: correct)

    # 解答結果に応じてメッセージを表示
    flash[:notice] = correct ? "正解！次の問題に進みましょう。" : "不正解。次の問題に進みましょう。"
  
    # 次の問題へリダイレクト
    redirect_to next_question_path
  end
end
