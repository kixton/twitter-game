class ScoresController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    scores = Score.all

    scores_array = []
    scores.each do |score|
      scores_array << { scores: score.scores, user: User.find(score.user_id), created_at: score.created_at }
    end  

    render json: scores_array
  end

  def show
  end

  def create
    @score = Score.new(score_params)
    respond_to do |format|
      if @score.save
        format.html { redirect_to action: "index", notice: "Score was successfully saved."}
        format.json { render json: @score}
      else
        format.json { render json: @score.errors }
      end
    end
  end

  def chart_scores
    user = User.find_by(twitter_uid: current_user.twitter_uid)
    scores = Score.where(user: user.id)

    scores_arr = []
    scores.each do |score|
      scores_arr << score.scores
    end

    render json: scores_arr
  end

  private

  def score_params
    params.require(:score).permit(:scores, :user_id)
  end
end
