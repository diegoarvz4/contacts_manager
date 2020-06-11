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

  def generate_string_in_last_four(last_four_digits)
    "**** "*4 + last_four_digits
  end

end
