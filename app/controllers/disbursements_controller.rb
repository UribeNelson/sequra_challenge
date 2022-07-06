class DisbursementsController < ApplicationController
  def index
    @disbursements = Disbursement.all
                      .where('DATE(start_date) <= ?', params['date'])
                      .where('? <= DATE(created_at)', params['date'])
                      .where('? is NULL or ? = merchant_id', params['merchant_id'], params['merchant_id'])
    render json: @disbursements, status: :ok
  end
end
