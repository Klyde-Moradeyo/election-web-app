class VoterSessionsController < ApplicationController
  before_action :set_voter_session, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!

  # GET /voter_sessions or /voter_sessions.json
  def index
    @voter_sessions = VoterSession.all
  end

  # GET /voter_sessions/1 or /voter_sessions/1.json
  def show; end

  # GET /voter_sessions/new
  def new
    @voter_session = VoterSession.new
  end

  # GET /voter_sessions/1/edit
  def edit; end

  def entry
    ballot = Ballot.find_by(access_token: params[:access_token])
    if ballot
      reset_session
      session[:ballot_user_id] = ballot.user_id
      session[:ballot_id] = ballot.id
      redirect_to new_voter_path
    end
  end

  def lobby
    if defined? session[:voter]["username"]
      @voter = Voter.find_by(username: session[:voter]["username"])
    else
      redirect_to "/it"
    end
    @ballot = Ballot.find_by(id: session[:ballot_id])
  end

  def sign_out
    reset_session
    redirect_to root_path
  end

  # POST /voter_sessions or /voter_sessions.json
  def create
    @voter_session = VoterSession.new(voter_session_params)

    respond_to do |format|
      if @voter_session.save
        format.html { redirect_to voter_session_url(@voter_session), notice: "Voter session was successfully created." }
        format.json { render :show, status: :created, location: @voter_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voter_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voter_sessions/1 or /voter_sessions/1.json
  def update
    respond_to do |format|
      if @voter_session.update(voter_session_params)
        format.html { redirect_to voter_session_url(@voter_session), notice: "Voter session was successfully updated." }
        format.json { render :show, status: :ok, location: @voter_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voter_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voter_sessions/1 or /voter_sessions/1.json
  def destroy
    @voter_session.destroy

    respond_to do |format|
      format.html { redirect_to voter_sessions_url, notice: "Voter session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  helper_method :calculate_results

  # Use callbacks to share common setup or constraints between actions.
  def set_voter_session
    @voter_session = VoterSession.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def voter_session_params
    params.fetch(:voter_session, {})
  end
end
