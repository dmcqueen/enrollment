class AdministratorsController < ApplicationController
  layout false

  # GET /administrators
  # GET /administrators.json
  def index
    @administrators = Administrator.order('updated_at desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administrators }
    end
  end

  # GET /administrators/1
  # GET /administrators/1.json
  def show
    @administrator = Administrator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administrator }
    end
  end

  # GET /administrators/new
  # GET /administrators/new.json
  def new
    @administrator = Administrator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administrator }
    end
  end

  # GET /administrators/1/edit
  def edit
    @administrator = Administrator.find(params[:id])
  end

  # POST /administrators
  # POST /administrators.json
  def create
    @administrator = Administrator.new(params[:administrator])

    respond_to do |format|
      if @administrator.save
        @administrators = Administrator.order('created_at desc').all
        @notice = 'Administrator was successfully created.'

        format.html { redirect_to @administrator, notice: 'Administrator was successfully created.' }
        format.json { render json: @administrator, status: :created, location: @administrator }
        format.js { render :index, notice: 'Administrator was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
        format.js { render :nothing => true }
      end
    end
  end

  # PUT /administrators/1
  # PUT /administrators/1.json
  def update
    @administrator = Administrator.find(params[:id])

    respond_to do |format|
      if @administrator.update_attributes(params[:administrator])
        @administrators = Administrator.order('updated_at desc').all

        format.html { redirect_to @administrator, notice: 'Administrator was successfully updated.' }
        format.json { head :ok }
        format.js { render :index }
      else
        format.html { render action: "edit" }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
        format.js { render :nothing => true }
      end
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  def destroy
    @administrator = Administrator.find(params[:id])
    @administrator.destroy

    respond_to do |format|
      format.html { redirect_to administrators_url }
      format.json { head :ok }
      format.js { render :nothing => true }
    end
  end
end
