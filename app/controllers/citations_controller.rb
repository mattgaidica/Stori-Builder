class CitationsController < ApplicationController
  before_action :set_citation, only: [:show, :edit, :update, :destroy]

  def read
    unless params[:citation_ids].nil?
      params[:citation_ids].each do |citation_id|
        Citation.find(citation_id).update(is_read: true)
      end
    end
    redirect_back(fallback_location: root_path)
  end

  # GET /citations
  # GET /citations.json
  def index
    @citations = Citation.all
  end

  # GET /citations/1
  # GET /citations/1.json
  def show
  end

  # GET /citations/new
  def new
    @citation = Citation.new
  end

  # GET /citations/1/edit
  def edit
  end

  # POST /citations
  # POST /citations.json
  def create
    redirect_back(fallback_location: root_path)
  end

  # PATCH/PUT /citations/1
  # PATCH/PUT /citations/1.json
  def update
    respond_to do |format|
      if @citation.update(citation_params)
        format.html { redirect_to @citation, notice: 'Citation was successfully updated.' }
        format.json { render :show, status: :ok, location: @citation }
      else
        format.html { render :edit }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citations/1
  # DELETE /citations/1.json
  def destroy
    @citation.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citation
      @citation = Citation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citation_params
      params.require(:citation).permit(:is_read, :cited_as, :source_id, :citation_ids)
    end
end
