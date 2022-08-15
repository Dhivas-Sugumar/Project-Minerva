class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json in order of created
  def index
    @courses = Course.filter_by_draft(false).order(created_at: :desc).page(params[:page])

  end  # GET /courses/1 or /courses/1.json


  def show
    unless @course.draft
      @review = Review.new
    end
    @instructor = @course.user
  end

  # GET /courses/new
  def new
    @course = Course.new
    @sections = @course.sections.build
    @category = Category.all
  end

  # GET /courses/1/edit
  def edit
    @category = Category.all
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
        if @course.save
          format.html { redirect_to course_url(@course), notice: "Course was successfully created! Thank you for your contribution." }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new, status: :unprocessable_entity }
          flash[:alert] = 'Could not create course. Please try again.'

        end
    end
    end


  # PATCH/PUT /courses/1 or /courses/1.json
  def update

    respond_to do |format|
      @sections.destroy_all
      if @course.draft?
        if @course.update(course_params)
          format.html { redirect_to course_url(@course), notice: "Draft was successfully updated." }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit, status: :unprocessable_entity }
          flash[:alert] = 'Could not update course draft. PLease try again later.'
        end

      else
        if @course.update(course_params)
          format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit, status: :unprocessable_entity }
          flash[:alert] = 'Could not update course. PLease try again later.'
        end

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
        flash[:alert] = 'Could not destroy course. PLease try again later.'
    end
    end
  end

  # action to publish a course.
  def publish
    respond_to do |format|
      if (@course.draft = false)
        format.html { redirect_to course_url(@course), notice: "Course was successfully published!" }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        flash[:alert] = 'Could not publish course. PLease try again later.'
      end
    end

  end

  #enrolls a user to this course
  def enroll
    attrs = {:user_id => current_user.id, :course_id => params["id"],:completed => false }
    @enroll = Enroll.new(attrs)
      if @enroll.save
        redirect_to course_url(@enroll.course_id), notice: "Enrolled in course!"
      else
        redirect_to course_url(@enroll.course_id), notice: "Enrolled in course!"
        flash[:alert] = 'Could not enroll in course. PLease try again later.'

      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
    @sections = @course.sections
    @category = @course.category

    unless @course.draft
      @enrolls = Enroll.all
      @reviews = @course.reviews

    end
  end


    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :description,:draft, :members, :average, :rating, :course_id, :user_id,:_destroy,:category_id,:banner,
                                     sections_attributes: [:title, :body,:_destroy, lessons_attributes: [:title, :body,:_destroy,
                                                                                               videos_attributes: [:title, :description, :thumbnail,:videofile,:_destroy]]])

    end

end


