require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get answer:string" do
    get answers_answer:string_url
    assert_response :success
  end

  test "should get question:references" do
    get answers_question:references_url
    assert_response :success
  end
end
