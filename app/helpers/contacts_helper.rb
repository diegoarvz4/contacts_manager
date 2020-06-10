module ContactsHelper

  def contact_fields_for_options

    [
      ['Nombre', 'name'],
      ['Fecha de Nacimiento', 'birthdate'],
      ['Email', 'email'],
      ['Teléfono', 'phone'],
      ['Dirección', 'address'],
      ['Tarjeta de Crédito', 'credit_card'],
    ]

  end

end
