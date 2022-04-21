class BallotResultsController < ApplicationController
  before_action :set_ballot_result, only: %i[show edit update destroy]

  # GET /ballot_results or /ballot_results.json
  def index
    @ballot_results = BallotResult.all
  end

  # GET /ballot_results/1 or /ballot_results/1.json
  def show; end

  # GET /ballot_results/new
  def new
    @ballot_result = BallotResult.new
  end

  # GET /ballot_results/1/edit
  def edit; end

  # POST /ballot_results or /ballot_results.json
  def create
    @ballot_result = BallotResult.new(ballot_result_params)

    respond_to do |format|
      if @ballot_result.save
        format.html { redirect_to ballot_result_url(@ballot_result), notice: "Ballot result was successfully created." }
        format.json { render :show, status: :created, location: @ballot_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ballot_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ballot_results/1 or /ballot_results/1.json
  def update
    respond_to do |format|
      if @ballot_result.update(ballot_result_params)
        format.html { redirect_to ballot_result_url(@ballot_result), notice: "Ballot result was successfully updated." }
        format.json { render :show, status: :ok, location: @ballot_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ballot_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ballot_results/1 or /ballot_results/1.json
  def destroy
    @ballot_result.destroy

    respond_to do |format|
      format.html { redirect_to ballot_results_url, notice: "Ballot result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ballot_result
    @ballot_result = BallotResult.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ballot_result_params
    params.require(:ballot_result).permit(:ballot_id, :question_result_id, :content)
  end
end
