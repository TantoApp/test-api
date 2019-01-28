class Api::V1::TestsController < ApplicationController
  def index
    run Test::Index
    render json: result["model"]
  end

  def show
    run Test::Show
    render json: result["model"]
  end

  def create
    run Test::Create do |result|
      if (errors = result["result.contract.default"].try(:errors)).present?
        render json: errors, status: :unprocessable_entity
      else
        render json: result['model'], status: :created, location: @api_v1_test
      end
    end
  end

  def update
    run Test::Update do |result|
      if (errors = result["result.contract.default"].try(:errors)).present?
        render json: errors, status: :unprocessable_entity
      else
        render json: result['model'], status: :created, location: @api_v1_test
      end
    end
  end

  def destroy
    run Test::Delete
  end
end
