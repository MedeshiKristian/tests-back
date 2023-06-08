class ResultsController < ApplicationController
  # before_action :authenticate_user!, except: :index
  before_action :set_result, only: %i[ show update destroy ]

  # GET /results
  def index
    @results = Result.all

    render json: @results
  end

  # GET /results/1
  def show
    test = Test.find(@result.test_id)
    render json: {
      result: @result,
      test: test,
      questions: test.questions
    }
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    if @result.save
      render json: @result, status: :created, location: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /results/1
  # def update
  #   if @result.update(result_params)
  #     render json: @result
  #   else
  #     render json: @result.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /results/1
  def destroy
    @result.destroy
  end

  def user_results
    results = Result.where(user_id: params[:id])
    tests = []
    for result in results
      tests.push(Test.find(result.test_id))
    end
    render json: results.zip(tests)
  end

  def test_results
    results = Result.where(test_id: params[:id])
    users = []
    for result in results
      users.push(User.find(result.user_id))
    end
    render json: results.zip(users)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:user_id, :test_id, :correct, :total, :answers)
    end
end
