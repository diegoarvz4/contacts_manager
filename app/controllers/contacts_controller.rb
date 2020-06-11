class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts.includes(:credit_card).paginate(page: params[:page])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)

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


  def import
    file = params[:file]
    current_user.contact_files.create(
      status: 'En espera'
    )
    contacts = ExtractContacts.call(file.path)
    session[:temp_contacts] = ActiveSupport::JSON.encode(contacts)
    redirect_to contacts_handle_path
  end

  def handle
    @contacts = ActiveSupport::JSON.decode(session[:temp_contacts])
    @contact = Contact.new
  end

  def upload
    current_contact_file = current_user.contact_files.last
    current_contact_file.update(status: 'Procesando')
    @contacts = ActiveSupport::JSON.decode(session[:temp_contacts])
    potential_contacts = GenerateContacts.call(@contacts, params[:contact])
    begin
      potential_contacts.each do |contact_hash|
        contact = current_user.contacts.build(contact_hash.select{|key| key.to_s != 'credit_card' })
        contact.build_credit_card(number: contact_hash['credit_card'])
        unless contact.save
          current_contact_file.file_errors.create(
            contact_info: contact_hash.to_s,
            message: contact.errors.full_messages.join(',')
          )
        end
      end
      flash.notice = current_user.contacts.length > 0 ? 'Contactos agregados.' : '0 contactos agregados' 
      current_contact_file.update(status: 'Terminado') 
    rescue StandardError => e
      flash.alert = e.message
      current_contact_file.update(status: 'Fallido')
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
