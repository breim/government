class Admin::QuestionsController < Admin::AdminController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    respond_with(@question, location: admin_question_path)
  end

  def new
    @question = Question.new
    respond_with(@question, location: new_admin_question_path)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_with(@question, lication: admin_questions_path)
  end

  def update
    @question.update(question_params)
    respond_with(@question, lication: admin_questions_path)
  end

  def destroy
    @question.destroy
    respond_with(@question, lication: admin_questions_path)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:name, :user_id)
    end
end
