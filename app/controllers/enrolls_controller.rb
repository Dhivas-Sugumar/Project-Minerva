class EnrollsController < ApplicationController
  before_action :set_enroll, only: %i[ show edit update destroy ]

  # GET /enrolls or /enrolls.json
  def index
    @enrolls = Enroll.all
  end

  # GET /enrolls/1 or /enrolls/1.json
  def show
  end

  # GET /enrolls/new
  def new
    @enroll = Enroll.new
  end

  # GET /enrolls/1/edit
  def edit
  end

  # POST /enrolls or /enrolls.json
  def create
    @enroll = Enroll.new(enroll_params)

    respond_to do |format|
      if @enroll.save
        format.html { redirect_to enroll_url(@enroll), notice: "Enroll was successfully created." }
        format.json { render :show, status: :created, location: @enroll }
      else
        format.html { render :new, status: :unprocessable_entity }
        flash[:alert] = 'Could not enroll in course. Please try again.'
      end
    end
  end

  # PATCH/PUT /enrolls/1 or /enrolls/1.json
  def update
    respond_to do |format|
      if @enroll.update(enroll_params)
        format.html { redirect_to enroll_url(@enroll), notice: "Enroll was successfully updated." }
        format.json { render :show, status: :ok, location: @enroll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        flash[:alert] = 'Could not update enroll. Please try again.'
      end
    end
  end

  # DELETE /enrolls/1 or /enrolls/1.json
  def destroy
    @enroll.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Successfully un enrolled." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enroll
      @enroll = Enroll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enroll_params
      params.require(:enroll).permit(:user_id, :course_id, :completed)
    end
end
