class BubblesController < ApplicationController
  before_action :set_bubble, only: [:show, :edit, :update, :destroy]
  # before_action :current_user, except: [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy]
  

  # GET /bubbles
  # GET /bubbles.json
  def index
    @bubbles = Bubble.desc(:score)


  end

  def upvote
    @bubble = Bubble.find(params[:id])
      if @bubble.save
      @bubble.vote_count += 1
      @bubble.time_bonus
      @bubble.bubble_score
      redirect_to :back
    end
  end

  def downvote
    @bubble = Bubble.find(params[:id])
    if @bubble.save
      @bubble.vote_count -= 1
      @bubble.time_bonus
      @bubble.bubble_score
      

      redirect_to :back
    end
  end


  # GET /bubbles/1
  # GET /bubbles/1.json
  def show
  end

  # GET /bubbles/new
  def new
    @bubble = current_user.bubbles.build
  end

  # GET /bubbles/1/edit
  def edit
  end

  # POST /bubbles
  # POST /bubbles.json
  def create
    @bubble = current_user.bubbles.build(bubble_params)

    respond_to do |format|
      if @bubble.save
        format.html { redirect_to @bubble, notice: 'Posting was successfully created.' }
        format.json { render :show, status: :created, location: @bubble }
        @bubble.time_bonus
        @bubble.bubble_score
      else
        format.html { render :new }
        format.json { render json: @bubble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bubbles/1
  # PATCH/PUT /bubbles/1.json
  def update
    respond_to do |format|
      if @bubble.update(bubble_params)
        format.html { redirect_to @bubble, notice: 'Posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @bubble }
      else
        format.html { render :edit }
        format.json { render json: @bubble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bubbles/1
  # DELETE /bubbles/1.json
  def destroy
    @bubble.destroy
    respond_to do |format|
      format.html { redirect_to bubbles_url, notice: 'Posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bubble
      @bubble = Bubble.find(params[:id])
    end

def authorized_user
      @bubble = current_user.bubbles.find_by(id: params[:id])
      redirect_to bubbles_path, notice: "Not authorized to edit this posting" if @bubble.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bubble_params
      params.require(:bubble).permit(:title, :body, :tag)
    end
end
