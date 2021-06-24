class PresignedurlController < ApplicationController
  def index
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    render json: {url: @s3_direct_post.url, fields: @s3_direct_post.fields}
  end
end
