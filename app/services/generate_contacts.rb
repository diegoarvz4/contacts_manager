
  class GenerateContacts

    def self.call(contacts, contact_params)
      new(contacts, contact_params).call
    end

    def initialize(contacts, contact_params)
      @contacts = contacts
      @contact_params = contact_params
    end

    def call
      potential_contacts = []

      @contacts.each do |contact_info|
        build_contact = {}
        contact_info.each_with_index do |value, index|
          next if index == 5 - 1
          build_contact[@contact_params[(index + 1).to_s]] = value
        end
        potential_contacts << build_contact
      end

      potential_contacts
    end

  end
