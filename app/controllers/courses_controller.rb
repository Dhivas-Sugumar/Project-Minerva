class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json in order of created
  def index
    @courses = Course.order(created_at: :desc).page(params[:page])

  end  # GET /courses/1 or /courses/1.json


  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @sections = @course.sections.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }

      end

    end
    end


  # PATCH/PUT /courses/1 or /courses/1.json
  def update

    respond_to do |format|
      @sections.destroy_all
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy

    respond_to do |format|
      @course.destroy
      if @course.destroyed?
        format.html { redirect_to root_url, notice: "Course was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
    end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
      @sections = @course.sections
      @enrolls = Enroll.all
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :description, :members, :average, :rating, :course_id, :user_id,:_destroy,:category_id,
                                     sections_attributes: [:title, :body,:_destroy, lessons_attributes: [:title, :body,:_destroy,
                                                                                               videos_attributes: [:title, :description, :thumbnail,:videofile,:_destroy]]])

    end

  # def page_params
  #   params.require(:page).permit(:at)
  # end
end


