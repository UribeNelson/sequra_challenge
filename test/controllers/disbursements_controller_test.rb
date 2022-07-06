require "test_helper"

class DisbursementsControllerTest < ActionDispatch::IntegrationTest
  test "should get all merchants disbursements" do
    get disbursements_path, params: { date: '2022-06-27'}
    r = JSON.parse(response.body)
    assert_equal 2, r.size, 'Disbursements are not 2'
  end

  test "should get only one merchant disbursements" do
    m = merchants(:one)
    get disbursements_path, params: { date: '2022-06-27', merchant_id: m.id}
    r = JSON.parse(response.body)
    assert_equal 1, r.size, 'More disbursements'
    assert_equal m.id, r[0]['merchant_id'].to_i, 'Disbursement not belonging to merchant'
  end
end
