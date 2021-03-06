class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :upvotecomment, :downvotecomment, :index]


def index
    @comment = Comment.desc(:score)
end



def upvotecomment
    @comment = Comment.find(params[:id])
    @comment.vote_count += 1
    if @comment.save
      @comment.comment_score
      redirect_to :back
    end
  end

  def downvotecomment
    @comment = Comment.find(params[:id])
    @comment.vote_count -= 1
    if @comment.save
      @comment.comment_score
      redirect_to :back
    end
  end



  def create
    @bubble = Bubble.find(params[:bubble_id])
    @comment = @bubble.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @bubble }
        format.json { render :show, status: :created, location: @comment }
        @bubble.bubble_score


      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end







  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:bubble_id, :body, :user_id)
    end
end
