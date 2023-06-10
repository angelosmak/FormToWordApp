require 'rubygems'
gem 'pdfkit', '>= 0.8.4'
require 'pdfkit'
class FormSubmissionsController < ApplicationController
  before_action :set_form_submission, only: %i[ show edit update destroy ]
  # GET /form_submissions/1 or /form_submissions/1.json
  def show
  end

  # GET /form_submissions/new
  def new
    @form_submission = FormSubmission.new
  end

  # GET /form_submissions/1/edi
  # POST /form_submissions or /form_submissions.json
  def create
    @form_submission = FormSubmission.new(form_submission_params)

    if @form_submission.save
      generate_pdf_document(@form_submission)
      redirect_to @form_submission, notice: 'Form submission was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /form_submissions/1 or /form_submissions/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_form_submission
    @form_submission = FormSubmission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def form_submission_params
    params.require(:form_submission).permit(
      :name,
      :email,
      :message,
      :country_of_origin,
      :languages,
      :location,
      :stage_of_asylum_procedure,
      :legal_request,
      :family_members_in_greece,
      :urgent,
      :detention
    )
  end


  def generate_pdf_document(form_submission)
    content = <<~HTML
      <h1>Hotline Form </h1>
      <p>Languages: #{form_submission.languages}</p>
      <p>Contry of origin: #{form_submission.country_of_origin}</p>
      <p>Languages: #{form_submission.languages}</p>
      <p>Asylum Procedure Stage: #{form_submission.location}</p>
      <p>Legal Request: #{form_submission.languages}</p>
      <p>Family in Greece: #{form_submission.languages}</p>
      <p>Urgent: #{form_submission.urgent}</p>
      <p>Urgent conditions: #{form_submission.urgent_conditions}</p>
      <p>Detention: #{form_submission.detention}</p>

    HTML

    pdfkit = PDFKit.new(content)
    file_path = "/Users/angelosathanasiosmakris/Desktop/#{form_submission.name}.pdf" # Replace with the desired absolute file path
    pdfkit.to_file(file_path)
  end
end
