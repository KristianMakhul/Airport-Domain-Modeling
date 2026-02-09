kbp = Airport.create!(
  name: "Boryspil International Airport",
  code: "KBP"
)

lhr = Airport.create!(
  name: "London Heathrow",
  code: "LHR"
)

terminal_d = kbp.terminals.create!(code: "D")
terminal_a = lhr.terminals.create!(code: "A")

gate_d1 = terminal_d.gates.create!(code: "D1")
gate_d2 = terminal_d.gates.create!(code: "D2")

counter_1 = terminal_d.check_in_counters.create!(code: "C1")
counter_2 = terminal_d.check_in_counters.create!(code: "C2")

airline = Airline.create!(
  name: "Ukraine International Airlines",
  code: "UIA"
)

aircraft = airline.aircrafts.create!(
  model: "Boeing 737"
)

(10..20).each do |row|
  %w[A B C D E F].each do |letter|
    Seat.create!(
      seat_number: "#{row}#{letter}",
      cabin_class: :economy,
      aircraft: aircraft
    )
  end
end

(3..6).each do |row|
  %w[A B C D].each do |letter|
    Seat.create!(
      seat_number: "#{row}#{letter}",
      cabin_class: :business,
      aircraft: aircraft
    )
  end
end

flight = Flight.create!(
  flight_number: "PS101",
  airline: airline,
  origin_airport: kbp,
  destination_airport: lhr
)

flight_instance = flight.flight_instances.create!(
  scheduled_departure_at: Time.current + 1.day,
  scheduled_arrival_at: Time.current + 1.day + 3.hours,
  status: :scheduled
)

GateAssignment.create!(
  gate: gate_d1,
  flight_instance: flight_instance,
  active_from: flight_instance.scheduled_departure_at - 30.minutes,
  active_to: flight_instance.scheduled_departure_at + 30.minutes
)

CheckInAssignment.create!(
  check_in_counter: counter_1,
  flight_instance: flight_instance,
  active_from: flight_instance.scheduled_departure_at - 2.hours,
  active_to: flight_instance.scheduled_departure_at - 30.minutes
)

passenger = Passenger.create!(
  first_name: "Ivan",
  last_name: "Petrenko",
  document_number: "UA1234567"
)

booking = Booking.create!(
  pnr: "PNR001ABC"
)

seat = aircraft.seats.find_by(seat_number: "12A")

ticket = Ticket.create!(
  booking: booking,
  passenger: passenger,
  flight_instance: flight_instance,
  seat: seat,
  checked_in: true
)

BoardingPass.create!(
  ticket: ticket
)

Baggage.create!(
  ticket: ticket,
  tag_number: "BAG123456",
  weight_kg: 18.5
)
