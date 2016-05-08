class CorrectionsController < ApplicationController
  before_action :set_correction, only: [:show, :edit, :update, :destroy]

  def create
    @correction = Correction.new(correction_params)

    respond_to do |format|
      if @correction.save
        format.html { redirect_to :back, notice: 'Correction was successfully created.' }
      else
        format.html { render :back }
      end
    end
  end

  def update
    correction_service = CorrectionRejectService.new(@correction, correction_params)
    respond_to do |format|
      if correction_service.perform
        format.html { redirect_to :back, notice: 'Correction was successfully updated.' }
        format.json { render :show, status: :ok, location: @correction }
      else
        format.html { render :edit }
        format.json { render json: @correction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @correction.destroy
    respond_to do |format|
      format.html { redirect_to corrections_url, notice: 'Correction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_correction
      @correction = Correction.find(params[:id])
    end

    def correction_params
      params.require(:correction).permit(:user_id, :answer_id, :text, explanation_attributes: [:text])
    end
end
