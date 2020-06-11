module CreditCards

  CREDIT_CARDS = {
    'UATP': [1],
    'Visa': [4],
    'Dankort': [5019],
    'American Express': [37, 34],
    'China T-Union': [37],
    'China UnionPay': [62, 81],
    'UkrCard': [6040, 6041],
    'RuPay': [60, 6521, 6522],
    'InterPayment': [636],
    'InstaPayment': (637..639).to_a,
    'JCB': (3528..3589).to_a,
    'Maestro UK': [6759, 676770, 676774],
    'Maestro': [50] + (56..69).to_a,
    'MIR': 	(2200..2204).to_a,
    'NPS Pridnestrovie': (6054740..6054744).to_a,
    'Mastercard': (2221..2720).to_a + (51..55).to_a,
    'Troy': 	(979200..979289).to_a,
    'Verve': (506099..506198).to_a + (650002..650027).to_a,
    'LankaPay': [357111],
    'Discover Card': [6011] + (622126..622925).to_a + (624000..626999).to_a + (628200..628899).to_a + [13, 64, 65],
    'Diners Club International': [36] + (38..39).to_a + (300..305).to_a + [3095], 
  }

  def get_franchise(number)

    CREDIT_CARDS.each do |key, values|
      values.each do |value|
        return key if number.to_s =~ /^#{Regexp.quote(value.to_s)}/ 
      end
    end

    nil
  end


end