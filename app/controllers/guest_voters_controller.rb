class GuestVotersController < ApplicationController
  before_action :set_guest_voter, only: %i[ show edit update destroy ]

  # GET /guest_voters or /guest_voters.json
  def index
    @guest_voters = GuestVoter.all
  end

  # GET /guest_voters/1 or /guest_voters/1.json
  def show
  end

  # GET /guest_voters/new
  def new
    @guest_voter = GuestVoter.new
  end

  # GET /guest_voters/1/edit
  def edit
  end

  # POST /guest_voters or /guest_voters.json
  def create
    @guest_voter = GuestVoter.new(guest_voter_params)

    respond_to do |format|
      if @guest_voter.save
        format.html { redirect_to guest_voter_url(@guest_voter), notice: "Guest voter was successfully created." }
        format.json { render :show, status: :created, location: @guest_voter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_voters/1 or /guest_voters/1.json
  def update
    respond_to do |format|
      if @guest_voter.update(guest_voter_params)
        format.html { redirect_to guest_voter_url(@guest_voter), notice: "Guest voter was successfully updated." }
        format.json { render :show, status: :ok, location: @guest_voter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guest_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_voters/1 or /guest_voters/1.json
  def destroy
    @guest_voter.destroy

    respond_to do |format|
      format.html { redirect_to guest_voters_url, notice: "Guest voter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_voter
      @guest_voter = GuestVoter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_voter_params
      params.require(:guest_voter).permit(:user_id, :username, :password, :vote_weight, :record_updated_at)
    end
end
