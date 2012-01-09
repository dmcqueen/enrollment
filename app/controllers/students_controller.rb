class StudentsController < ApplicationController
  layout false

  # GET /students
  # GET /students.json
  def index
    @students = Student.order('updated_at desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        @students = Student.order('created_at desc').all
        @student.periods = Period.find(params[:period_ids]) unless params[:period_ids].nil?
        @notice = 'Student was successfully created.'

        format.html { render :show, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
        format.js { render :index, notice: 'Student was successfully created.' } 
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.js { render :nothing => true } 
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        @student.periods = Period.find(params[:period_ids])
        @students = Student.order('updated_at desc').all

        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :ok }
        format.js { render :index }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.js { render :nothing => true }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { render :index } 
      format.json { head :ok }
      format.js { render :nothing => true }
    end
  end
end
