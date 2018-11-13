class StrandsController < ApplicationController
  before_action :set_strand, only: [:show, :edit, :update, :destroy]

  # GET /strands
  # GET /strands.json
  def index
    @strands = Strand.all
  end

  # GET /strands/1
  # GET /strands/1.json
  def show
  end

  # GET /strands/new
  def new
    @strand = Strand.new
  end

  # GET /strands/1/edit
  def edit
  end

  # POST /strands
  # POST /strands.json
  def create
    @strand = Strand.new(strand_params)

    respond_to do |format|
      if @strand.save
        format.html { redirect_to @strand, notice: 'Strand was successfully created.' }
        format.json { render :show, status: :created, location: @strand }
      else
        format.html { render :new }
        format.json { render json: @strand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strands/1
  # PATCH/PUT /strands/1.json
  def update
    respond_to do |format|
      if @strand.update(strand_params)
        format.html { redirect_to @strand, notice: 'Strand was successfully updated.' }
        format.json { render :show, status: :ok, location: @strand }
      else
        format.html { render :edit }
        format.json { render json: @strand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strands/1
  # DELETE /strands/1.json
  def destroy
    @strand.destroy
    respond_to do |format|
      format.html { redirect_to strands_url, notice: 'Strand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strand
      @strand = Strand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strand_params
      params.require(:strand).permit(:position)
    end
end
