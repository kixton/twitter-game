class ScoresController < ApplicationController
  def index
    @scores = Score.all

    scores_array = []
    @scores.each do |score|
      scores_array << { scores: score.scores, user: User.find(score.user_id), created_at: score.created_at }
    end  

    render json: scores_array
  end

  def show
  end

  def chart_scores
    @user = User.find_by(twitter_uid: current_user.twitter_uid)
    @scores = Score.where(user: @user.id)

    scores_arr = []
    @scores.each do |score|
      scores_arr << score.scores
    end

    render json: scores_arr
  end
end
