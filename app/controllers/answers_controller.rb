class AnswersController < ApplicationController
  # def answer:string
  # end
# check this out later
  # def question:references
  # end
  def show

  end

  def index

  end

  def new
      @answer = Answer.new
  end
  
  def create
      @question = Question.last
      @answer = @question.answers.new(answers_params)

    if @answer.save
      flash[:success] = "Question created successfully "
       redirect_to(new_answer_path(@question))
    else
      render 'new'
    end
  end

  def destroy
      
  end
  
  def update
      
  end
  
  private
    # Only allow a list of trusted parameters through.
  def answers_params
    params.require(:answer).permit(:answer)
  end
end
