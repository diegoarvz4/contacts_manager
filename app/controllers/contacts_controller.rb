require "csv";


class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = current_user.contacs.build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    file = params[:file]
    contacts = ExtractContacts.call(file.path)
    session[:temp_contacts] = ActiveSupport::JSON.encode(contacts)
    redirect_to contacts_handle_path
  end

  def handle
    @contacts = ActiveSupport::JSON.decode(session[:temp_contacts])
    @contact = Contact.new
  end

  def upload

    @contacts = ActiveSupport::JSON.decode(session[:temp_contacts])
    potential_contacts = GenerateContacts.call(@contacts, params[:contact])
    potential_contacts.each do |contact_hash|
     current_user.contacts.create(contact_hash)
    end

    redirect_to contacts_path

  end



  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :phone, :birthdate, :address, :user_id)
    end
end
