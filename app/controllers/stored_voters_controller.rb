class StoredVotersController < ApplicationController
  before_action :set_stored_voter, only: %i[show edit update destroy]

  # GET /stored_voters or /stored_voters.json
  def index
    @stored_voters = StoredVoter.all
  end

  # GET /stored_voters/1 or /stored_voters/1.json
  def show; end

  # GET /stored_voters/new
  def new
    @stored_voter = StoredVoter.new
  end

  # GET /stored_voters/1/edit
  def edit; end

  # POST /stored_voters or /stored_voters.json
  def create
    @stored_voter = StoredVoter.new(stored_voter_params)

    respond_to do |format|
      if @stored_voter.save
        format.html { redirect_to stored_voter_url(@stored_voter), notice: "Stored voter was successfully created." }
        format.json { render :show, status: :created, location: @stored_voter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stored_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stored_voters/1 or /stored_voters/1.json
  def update
    respond_to do |format|
      if @stored_voter.update(stored_voter_params)
        format.html { redirect_to stored_voter_url(@stored_voter), notice: "Stored voter was successfully updated." }
        format.json { render :show, status: :ok, location: @stored_voter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stored_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stored_voters/1 or /stored_voters/1.json
  def destroy
    @stored_voter.destroy

    respond_to do |format|
      format.html { redirect_to stored_voters_url, notice: "Stored voter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stored_voter
    @stored_voter = StoredVoter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stored_voter_params
    params.require(:stored_voter).permit(:user_id, :username, :password, :email, :vote_weight)
  end
end
