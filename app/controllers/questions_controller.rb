class QuestionsController < ApplicationController
  before_filter :find_question, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Question was successfully created."
      redirect_to @question
    else
      flash[:alert] = "Question could not be created."
      render "new"
    end
  end

  def show
    #
  end

private
  def find_question
    @question = Question.find(params[:id])
  end

end

