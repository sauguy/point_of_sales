def p_o_s(seq)
  {
    name: "POS #{seq}",
    street: "Hauptstr. #{seq}",
    city: 'Berlin',
    zip_code: '10123',
    country: 'de',
    state: 'Berlin',
    phone: "0049 172 123 #{seq}",
    latitude: 52.49 + seq,
    longitude: 13.42
  }
end

3.times do |i|
  Account.create(source_db: 'salesforce', accountable: DealerPos.new(p_o_s(i)))
end
