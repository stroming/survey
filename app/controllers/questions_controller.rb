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
  
        respond_to do |format|
          if @survey.save
            format.html { redirect_to new_question_path , notice: "User was successfully created." }
          #   format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new, status: :unprocessable_entity }
          #   format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        
    end
    
    def update
        
    end
    
    private
      # Only allow a list of trusted parameters through.
      def question_params
        params.require(:question).permit(:question)
      end

end
