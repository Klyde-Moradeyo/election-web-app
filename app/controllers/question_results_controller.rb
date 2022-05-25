class QuestionResultsController < ApplicationController
  before_action :set_question_result, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!

  # GET /question_results or /question_results.json
  def index
    @question_results = QuestionResult.all
  end

  # GET /question_results/1 or /question_results/1.json
  def show; end

  # GET /question_results/new
  def new
    @question_result = QuestionResult.new
  end

  # GET /question_results/1/edit
  def edit; end

  # POST /question_results or /question_results.json
  def create
    @question_result = QuestionResult.new(question_result_params)
    @question_result.voter_id = session[:voter]["id"]
    @question_result.ballot_id = session[:voter]["ballot_id"]

    respond_to do |format|
      if @question_result.save
        format.html do
          redirect_to request.referer, notice: "Question result was successfully created."
        end
        format.json { render :show, status: :created, location: @question_result }
      else
        if QuestionResult.where(id: @question_result.voter_id)
          format.html { redirect_to request.referer, notice: "You have already Voted" }
        else
          format.html { redirect_to request.referer, notice: "Error Saving Question" }
        end
        format.json { render json: @question_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_results/1 or /question_results/1.json
  def update
    respond_to do |format|
      if @question_result.update(question_result_params)
        format.html do
          redirect_to request.referer, notice: "Question result was successfully updated."
        end
        format.json { render :show, status: :ok, location: @question_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_results/1 or /question_results/1.json
  def destroy
    @question_result.destroy

    respond_to do |format|
      format.html { redirect_to question_results_url, notice: "Question result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question_result
    @question_result = QuestionResult.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_result_params
    params.require(:question_result).permit(:question_id, :ballot_id, :voter_id, :option_id, :content)
  end
end
