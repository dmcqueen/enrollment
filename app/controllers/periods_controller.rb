class PeriodsController < ApplicationController
  layout false

  # GET /periods
  # GET /periods.json
  def index
    @periods = Period.order('updated_at desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @periods }
    end
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
    @period = Period.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @period }
    end
  end

  # GET /periods/new
  # GET /periods/new.json
  def new
    @period = Period.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @period }
    end
  end

  # GET /periods/1/edit
  def edit
    @period = Period.find(params[:id])
  end

  # POST /periods
  # POST /periods.json
  def create
    @period = Period.new
    @period.hours = params[:period][:hours]
    @period.quarter = params[:period][:quarter]
    @period.year = params[:period][:year]
    @period.course = Course.find(params[:period][:course])

    respond_to do |format|
      if @period.save
        @periods = Period.order('created_at desc').all
        @notice = 'Period was successfully created.'

        format.html { redirect_to @period, notice: 'Period was successfully created.' }
        format.json { render json: @period, status: :created, location: @period }
        format.js { render :index }
      else
        format.html { render action: "new" }
        format.json { render json: @period.errors, status: :unprocessable_entity }
        format.js { render :nothing => true }
      end
    end
  end

  # PUT /periods/1
  # PUT /periods/1.json
  def update
    @period = Period.find(params[:id])
    @period.hours = params[:period][:hours]
    @period.quarter = params[:period][:quarter]
    @period.year = params[:period][:year]
    @period.course = Course.find(params[:period][:course])

    respond_to do |format|
      if @period.save
        @periods = Period.order('updated_at desc').all

        format.html { redirect_to @period, notice: 'Period was successfully updated.' }
        format.json { head :ok }
        format.js { render :index }
      else
        format.html { render action: "edit" }
        format.json { render json: @period.errors, status: :unprocessable_entity }
        format.js { render :nothing => true }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @period = Period.find(params[:id])
    @period.destroy

    respond_to do |format|
      format.html { redirect_to periods_url }
      format.json { head :ok }
      format.js { render :nothing => true }
    end
  end
end
