# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new; end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(test_id: @question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
