require 'aws-sdk-s3'
class GameRoundsController < ApplicationController
  def index
    render json: GameRound.all
  end

  def create
    round = GameRound.new(game_id: params[:game_id])

    if params[:drawing]
      file_name = File.basename(params[:drawing].tempfile)
      s3_uploader(params[:game_id], file_name, params[:drawing].tempfile)

      round.drawing = "https://server-telephone.s3-us-west-2.amazonaws.com/#{params[:game_id]}/#{file_name}"
    else
      round.sentence = params[:sentence]
    end

    round.save
    render json: round
  end

  private

  def s3_uploader(prefix, file_name, file_path)
    s3 = Aws::S3::Resource.new(region: 'us-west-2')
    target_obj = s3.bucket('server-telephone').object("#{prefix}/#{file_name}")
    target_obj.upload_file(file_path)
  end
end
