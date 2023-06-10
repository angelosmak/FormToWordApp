
class AddFieldsToFormSubmissions < ActiveRecord::Migration[6.1]
  def change
    remove_column :form_submissions, :email
    remove_column :form_submissions, :message
    add_column :form_submissions, :country_of_origin, :string
    add_column :form_submissions, :languages, :string
    add_column :form_submissions, :location, :string
    add_column :form_submissions, :asylum_procedure_stage, :string
    add_column :form_submissions, :legal_request, :string
    add_column :form_submissions, :family_members_in_greece, :boolean
    add_column :form_submissions, :urgent, :boolean
    add_column :form_submissions, :detention, :boolean
  end
end
