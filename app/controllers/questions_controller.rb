class QuestionsController < ApplicationController
    def show

    end

    def index

    end

    def new
        @question = Question.new
    end
    
    def create
        @survey = Survey.last
        @question = @survey.questions.new(question_params)
        
        if @question.save
            flash[:success] = "Question created successfully"
            redirect_to(new_answer_path(@question))
        else
            render 'new'
        end
    end

    def update
      
    end

    def destroy
        
    end

    private
    # Only allow a list of trusted parameters through.
    def question_params
        params.require(:question).permit(:question)
    end
end