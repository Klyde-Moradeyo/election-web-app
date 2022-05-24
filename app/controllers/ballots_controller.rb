class BallotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ballot, only: %i[show edit update destroy]

  # GET /ballots or /ballots.json
  def index
    # @ballots = Ballot.all
    @ballots = current_user.ballots
  end

  # GET /ballots/1 or /ballots/1.json
  def show
    @question = Question.new({ ballot_id: @ballot.id })
    @question.options.new
  end

  # GET /ballots/new
  def new
    @ballot = Ballot.new
    # @question = @ballot.questions.build
  end

  # GET /ballots/1/edit
  def edit
    @ballot = Ballot.find(params[:id])
  end

  # POST /ballots or /ballots.json
  def create
    @ballot = Ballot.new(ballot_params)

    respond_to do |format|
      if @ballot.save
        current_user.add_role :host, @ballot
        format.html { redirect_to user_ballot_url(current_user, @ballot), notice: "Ballot was successfully created." }
        format.json { render :show, status: :created, location: @ballot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ballots/1 or /ballots/1.json
  def update
    respond_to do |format|
      if @ballot.update(ballot_params)
        format.html { redirect_to user_ballots_url, notice: "Ballot was successfully updated." }
        format.json { render :show, status: :ok, location: @ballot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ballots/1 or /ballots/1.json
  def destroy
    @ballot.destroy

    respond_to do |format|
      format.html { redirect_to user_ballots_url, notice: "Ballot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # LAUNCH ballot
  def launch
    @ballot = Ballot.find(params[:ballot_id])
  end

  # Ballot Voters
  def voters
    @ballot = Ballot.find(params[:ballot_id])
    @voters = @ballot.voters
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ballot
    @ballot = Ballot.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ballot_params
    params.require(:ballot).permit(:user_id, :title, :description, :start_date, :end_date,
                                   :show_voter_results, :access_token, :expected_voters, 
                                   :voting_type, :seats)
  end
end
