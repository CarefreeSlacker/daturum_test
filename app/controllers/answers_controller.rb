class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]


  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to :back, notice: 'Answer was successfully created.' }
      else
        format.html { render :back }
      end
    end
  end

  def update
    answer_corrector = AnswerCorrectorService.new(@answer, answer_params)
    respond_to do |format|
      if answer_corrector.perform
        format.html { redirect_to :back, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { redirect_to :back, notice: "Correction rolled back because #{answer_corrector.answer.errors.full_messages}" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:user_id, :question_id, :text, :corrected_text, corrections_attributes: [:id])
    end
end
