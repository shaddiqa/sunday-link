class Api::V1::PostsController < ApplicationController
  def index
   data =  {
      "message" => "Success",
      "data"=> [
        {
          "id" => "vtlink_id_1",
          "name" => "T-Shirt",
          "gross_amount" => "1000.00",
          "link" => "http://localhost:3000/v2/vtlink/vtlink_id_1",
          "social_medias" => [
            {
              "id" => "facebook_post_id_1",
              "type" => "Facebook",
              "auth_params" => {
                "app_id" => "abc",
                "app_secret"=> "def",
                "access_token"=> "ghi"
              }
            },
            {
              "id" => "twitter_id_1",
              "type"=> "Twitter",
              "auth_params"=> {
                "consumer_key"=> "abc",
                "consumer_secret" => "def",
                "access_token"=> "ghi",
                "access_token_secret"=> "jkl"
              }
            }
          ]
        },
        {
          "id" => "vtlink_id_2",
          "name" => "T-Shirt2",
          "gross_amount" => "1000.00",
          "link" => "http://localhost:3000/v2/vtlink/vtlink_id_1",
          "social_medias" => [
            {
              "id" => "facebook_post_id_1",
              "type" => "Facebook",
              "auth_params" => {
                "app_id" => "abc",
                "app_secret"=> "def",
                "access_token"=> "ghi"
              }
            },
            {
              "id" => "twitter_id_1",
              "type"=> "Twitter",
              "auth_params"=> {
                "consumer_key"=> "abc",
                "consumer_secret" => "def",
                "access_token"=> "ghi",
                "access_token_secret"=> "jkl"
              }
            }
          ]
        }
      ],
      "page" => 1,
      "per_page" => 2,
      "total_page" => 2
     }.as_json
    render json: data
  end
end
