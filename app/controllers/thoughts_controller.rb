class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  def transfer
    @thought = Thought.find(params[:id])
    Hold.all.each do |hold|
      @thought.strands.create :annotation => hold.annotation
    end
    Hold.destroy_all
    redirect_back(fallback_location: root_path)
  end

  # GET /thoughts
  # GET /thoughts.json
  def index
    @thoughts = Thought.all
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
    @thought.touch
  end

  # GET /thoughts/new
  def new
    @thought = Thought.new
  end

  # GET /thoughts/1/edit
  def edit
    @thought.touch
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    @thought = Thought.new(thought_params)

    respond_to do |format|
      if @thought.save
        format.html { redirect_to edit_thought_path(@thought), notice: 'Thought was successfully created.' }
        format.json { render :show, status: :created, location: @thought }
      else
        format.html { render :new }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thoughts/1
  # PATCH/PUT /thoughts/1.json
  def update
    respond_to do |format|
      if @thought.update(thought_params)
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { render :show, status: :ok, location: @thought }
      else
        format.html { render :edit }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought.destroy
    respond_to do |format|
      format.html { redirect_to thoughts_url, notice: 'Thought was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thought
      @thought = Thought.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thought_params
      params.require(:thought).permit(:name)
    end
end
