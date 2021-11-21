class SurveysController < ApplicationController

    # GET /users or /users.json
    def index
      @surveys = Survey.all
    end
  
    # GET /users/1 or /users/1.json
    def show
      @surveys = Survey.all
    end
  
    # GET /users/new
    def new
      @survey = Survey.new
    end
  
    # GET /users/1/edit
    def edit
      @surveys = Survey.all
    end
  
    def update
      @survey = Survey.find(params[:id])
      if @survey.update(survey_params)
        flash[:success] = "Your survey was updated successfully"
        redirect_to root
      else
        render 'edit'
      end
    end
  
    # POST /users or /users.json
    def create
      @survey = Survey.new(survey_params)
      @survey.user_id = current_user.id

      respond_to do |format|
        if @survey.save
          format.html { redirect_to root_path, notice: "User was successfully created." }
        #   format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
        #   format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /users/1 or /users/1.json
    def destroy
      @survey.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        # format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @survey = Survey.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def survey_params
        params.require(:survey).permit(:title, :description)
      end
  end
  