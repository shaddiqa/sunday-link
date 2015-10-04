class Api::V1::PostsController < ApplicationController
  def index
    data = [{
      vt_id: 1,
      name: "Name Tes",
      email: "Email Tes",
      product: "Product Tes"
    },
    {
      vt_id: 2,
      name: "Name Tes",
      email: "Email Tes",
      product: "Product Tes"
    },
    {
      vt_id: 3,
      name: "Name Tes",
      email: "Email Tes",
      product: "Product Tes"
    },
    {
      vt_id: 4,
      name: "Name Tes",
      email: "Email Tes",
      product: "Product Tes"
    },
    {
      vt_id: 5,
      name: "Name Tes",
      email: "Email Tes",
      product: "Product Tes"
    },
    {
      vt_id: 6,
      name: "Name Tes",
      email: "Email Tes",
      product: "Product Tes"
    }
    ]
    render json: { message: "success", data: data, meta_data: {current_page:1 , total_page: 2, total_data: 6} }
  end
end
