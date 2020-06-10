require "csv";

  class ExtractContacts

    def self.call(file)
      new(file).call
    end

    def initialize(file)
      @file = file
    end

    def call
      contacts = []
      CSV.foreach(@file, headers: false) do |row|
        contacts << row
      end
      contacts
    end

  end
