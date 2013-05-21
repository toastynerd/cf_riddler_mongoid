class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_question, :only => [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.users << current_user
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

  def edit
    #
  end

  def update
    @question.users << current_user
    if @question.update_attributes(params[:question])
      flash[:notice]="Question has been updated."
      redirect_to @question
    else
      flash[:notice] = "Question has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @question.destroy
    flash[:notice]= "Question has been deleted."
    redirect_to questions_path
  end
private
  def find_question
    @question = Question.find(params[:id])
  end

end

