class GameRound < ApplicationRecord
  belongs_to :game

  def s3_uploader(prefix, file_path)
    s3 = Aws::S3::Resource.new(region: 'us-west-2')
    file_name = File.basename(file_path)
    target_obj = s3.bucket('server-telephone').object("#{prefix}/#{file_name}")
    target_obj.upload_file(file_path)
  end
  
  def s3_downloader(s3_file_path, local_path)
    s3 = Aws::S3::Resource.new(region: 'us-west-2')
    source_obj = s3.bucket('server-telephone').object(s3_file_path)
    source_obj.get(response_target: local_path)
    puts "s3://server-telephone/#{s3_file_path} has been downloaded to #{local_path}"
  end
end
