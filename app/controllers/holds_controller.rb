class HoldsController < ApplicationController
  before_action :set_hold, only: [:show, :edit, :update, :destroy]
  
  # GET /holds
  # GET /holds.json
  def index
    @holds = Hold.all
  end

  # GET /holds/1
  # GET /holds/1.json
  def show
  end

  # GET /holds/new
  def new
    @hold = Hold.new
  end

  # GET /holds/1/edit
  def edit
  end

  # POST /holds
  # POST /holds.json
  def create
    @hold = Hold.new(hold_params)
    @hold.annotation_id = params[:annotation_id] if params.has_key?(:annotation_id)

    respond_to do |format|
      if @hold.save
        format.html { redirect_back(fallback_location: root_path, anchor: "annot#{@hold.annotation_id}", status: 303) }
        format.json { render :show, status: :created, location: @hold }
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @hold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holds/1
  # PATCH/PUT /holds/1.json
  def update
    respond_to do |format|
      if @hold.update(hold_params)
        format.html { redirect_to @hold, notice: 'Hold was successfully updated.' }
        format.json { render :show, status: :ok, location: @hold }
      else
        format.html { render :edit }
        format.json { render json: @hold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holds/1
  # DELETE /holds/1.json
  def destroy
    @hold.destroy
    # respond_to do |format|
    #   format.html { redirect_to holds_url, notice: 'Hold was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hold
      @hold = Hold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hold_params
      params.fetch(:hold, {})
    end
end
