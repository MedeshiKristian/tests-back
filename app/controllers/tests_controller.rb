class TestsController < ApplicationController
  # before_action :set_course, only: :create
  before_action :set_test, only: %i[ show update destroy ]

  # GET /tests
  def index
    @tests = Test.all

    render json: @tests
  end

  # GET /tests/1
  def show
    render json: {
      test: @test,
      questions: @test.questions
    }
  end

  # POST /tests
  def create
    # @test = @course.tests.build(test_params)
    @test = Test.new(test_params)

    if @test.save
      render json: @test, status: :created, location: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tests/1
  def update
    if @test.update(test_params)
      render json: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:course_id, :topic, :deadline_seconds)
    end
end
