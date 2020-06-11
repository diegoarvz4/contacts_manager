class ContactFilesController < ApplicationController
  def index
    @contact_files = current_user.contact_files.includes(:file_errors)
  end
end
