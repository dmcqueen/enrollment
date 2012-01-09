class CoursesController < ApplicationController
  layout false

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.order('updated_at desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new
    @course.name = params[:course][:name]
    @course.description = params[:course][:description]
    @course.teacher = Teacher.find(params[:course][:teacher])

    respond_to do |format|
      if @course.save
        @courses = Course.order('created_at desc').all
        @notice = 'Course was successfully created.'
 
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
        format.js { render :index, notice: 'Course was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
        format.js {render :nothing => true }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    @course.name = params[:course][:name]
    @course.description = params[:course][:description]
    @course.teacher = Teacher.find(params[:course][:teacher])

    respond_to do |format|
      if @course.save
        @courses = Course.order('updated_at desc').all

        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :ok }
        format.js { render :index }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
        format.js { render :nothing => true }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :ok }
      format.js { render :nothing => true }
    end
  end
end
