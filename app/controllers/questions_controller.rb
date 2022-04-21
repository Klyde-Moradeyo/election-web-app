class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_ballot, only:[:create, :index, :new]

  # GET /ballots/1/questions or /ballots/1/questions.json
  def index
    @questions = Question.all
    @questions = ballots.questions
  end

  # GET /questions/1  or /ballots/1/questions/1.json
  def show
  end

  # GET /ballots/1/questions/new
  def new
    @ballot = Question.find(params[:ballot_id])
    @question = @ballot.questions.new
  end
  
  # GET /questions/1/edit
  def edit
  end

  # POST /polls/1/questions or /polls/1/questions.json
  def create
    @question = @ballot.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to user_ballot_path(current_user.id, @ballot), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/2.json
  def destroy
    # @ballot = Question.find(params[:ballot_id])
    session[:return_to] ||= request.referer
    @question.destroy

    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      # do not write this in a single unreadable line
      params.require(:question).permit(
        :question_type, 
        :title, 
        :description,
        :randomize_selection, 
        :voter_abstain, 
        # do not wrap hash arguments in brackets 
        # as it will break if/when the `permit` method is changed to use real keyword arguments 
        # for has_many assocations the key naming convention is also plural_attributes
        options_attributes: [
          :party_id, 
          :title, 
          :description
        ]
      )
    end
    
    def set_ballot
      @ballot = Ballot.find(params[:ballot_id])
    end
end
