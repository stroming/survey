class SurveysController < ApplicationController
    before_action :set_survey, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    # GET /surveys
    def index
      @survey = Survey.all
    end
    
    # Get /all_user_surveys
    def all_user_surveys
      @survey = Survey.where(user_id: current_user.id)
    end

    # GET /users/1 or /users/1.json
    def show

    end
  
    # GET /users/new
    def new
      @survey = Survey.new
    end
  
    # GET /users/1/edit
    def edit

    end
  
    def update
      if @survey.update(survey_params)
        flash[:success] = "Your survey was updated successfully"
        redirect_to root_path
      else
        render 'edit'
      end
    end
  
    # POST /users or /users.json
    def create
      @survey = Survey.new(survey_params)
      @survey.user_id = current_user.id

        if @survey.save
          flash[:success] = "Survey created successfully "
          redirect_to(new_question_path(@survey))
        else
          render 'new'
        end
    end
  
    # DELETE /users/1 or /users/1.json
    def destroy
      @survey.destroy
      redirect_to(surveys_path)
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_survey
        @survey = Survey.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def survey_params
        params.require(:survey).permit(:title, :description)
      end

      def require_same_user
        if current_user != @survey.user and !current_user.admin
          flash[:danger] = "You can only edit your own articles"
          redirect_to(root_path)
        end
      end
  end
  