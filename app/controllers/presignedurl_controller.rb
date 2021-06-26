class PresignedurlController < ApplicationController
  def index
    filename = params[:filename]
    key = "uploads/#{SecureRandom.uuid}/#{filename}"
    expire_time = 60*60 #seconds
    signer = Aws::S3::Presigner.new
    post_url = signer.presigned_url(:put_object, bucket: "maskenpa1001", key: key, acl: 'public-read', content_type: "multipart/form-data", expires_in: expire_time)
    geturl = "https://maskenpa1001.s3.ap-northeast-1.amazonaws.com/#{key}"
    @img = Img.new(username: params[:username], imagepath: geturl)
    @img.save
    render json: {post_url: post_url}
  end

  private
    # Only allow a trusted parameter "white list" through.
    def presignedurl_params
      params.permit(:filename, :username)
    end
end
