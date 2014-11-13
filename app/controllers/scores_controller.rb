class ScoresController < ApplicationController
  def index
    @scores = Score.all
    #iterate through @scores
      #each score.user_id
    scores_array = []
    @scores.each do |score|
      scores_array << { scores: score.scores, user: User.find(score.user_id).full_name }
    end

    render json: scores_array
  end

  def show
  end
end
