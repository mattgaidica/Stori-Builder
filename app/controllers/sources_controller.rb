class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy, :reimport]

  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
    redirect_to edit_source_path(@source)
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
    @citations_read = @source.citations.where(is_read: true).order(updated_at: :desc)
    @citations_unread = @source.citations.where(is_read: false).order(:created_at)
  end

  def reimport
    doc_info = Source.extract_doc(@source.html_file)
    @source.annotate(doc_info)
    redirect_to edit_source_path(@source)
  end

  def import
    new_source_count = 0;
    if params[:source_path].present?
      if File.file?params[:source_path]
        files = [params[:source_path]]
      else
        files = Dir["#{params[:source_path]}/*.html"]
      end
      files.each do |html_file|
        # check for file, if exists skip it, handle re-import elsewhere
        if Source.where(html_file: html_file).empty?
          doc_info = Source.extract_doc(html_file)
          @source = Source.find_or_initialize_by(title: doc_info[:title])
          @source.authors = doc_info[:authors]
          @source.html_file = html_file
          if @source.save
            new_source_count += 1;
            @source.annotate(doc_info)
          end
        end
      end
    end
    if new_source_count.eql? 1
      redirect_to edit_source_path(@source)
    else
      redirect_to sources_url
    end
  end

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new(source_params)

    respond_to do |format|
      if @source.save
        format.html { redirect_to edit_source_path(@source), notice: 'Source was successfully created.' }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to edit_source_path(@source), notice: 'Source was successfully updated.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: 'Source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:title, :authors, :hashtags_copy, annotations_attributes: [:id, :body, :body_source, :is_summary, :is_finding], citations_attributes: [:id, :is_read])
    end
end
