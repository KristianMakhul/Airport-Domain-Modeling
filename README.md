### **Ruby on Rails Trainee Test Task**

This project implements a domain model for an Airport Management System using Ruby on Rails.
The focus of the implementation is on:

- Data modeling
- Relationships between entities
- Business rules and validations
- Database normalization
- Time-based resource conflict handling

*UI, controllers, and views are intentionally excluded as required by the task.

### **Setup and run**

**Requirements**
- Ruby 3.x
- Rails 7.x
- PostgreSQL

**Installation**
```
git clone git@github.com:KristianMakhul/Airport-Domain-Modeling.git
cd airport_domain_modeling
bundle install
```

**Database setup**
```
rails db:create
rails db:migrate
rails db:seed
```

### **Domain assumptions**

- An Airport is identified by a unique code and represents a physical aviation hub.
- Each airport contains multiple terminals, which group passenger infrastructure.
- A Terminal contains Gates (for boarding) and Check-in Counters (for passenger check-in).
- An Airline operates flights and owns or manages aircraft.
- An Aircraft belongs to a single airline and contains seats divided into cabin classes.
- A Flight represents a route operated by an airline between two airports.
- A FlightInstance represents a specific scheduled occurrence of a flight.
- A Passenger can travel on multiple flights and may have multiple tickets under one booking.

### **Model relationships**

- Airport has_many Terminals
- Terminal belongs_to Airport
- Terminal has_many Gates and CheckInCounters
- Airline has_many Aircrafts and Flights
- Aircraft belongs_to Airline and has_many Seats
- Flight belongs_to Airline and to two Airports (origin and destination)
- Flight has_many FlightInstances
- FlightInstance has_one GateAssignment and CheckInAssignment
- Booking has_many Tickets
- Ticket belongs_to Booking, Passenger, FlightInstance and Seat
- BoardingPass and Baggage belong_to Ticket

### **Key business rules and validations**

- Airport and Airline codes are unique and enforced at both model and database levels
- Flight number is unique within the scope of an Airline
- Seat number is unique within the scope of an Aircraft
- Booking PNR is globally unique
- Gate and Check-in assignments are valid only within defined time intervals
- A Seat cannot be assigned to more than one Ticket for the same FlightInstance
- Enum values (such as cabin class and flight status) are validated and constrained

### **Design considerations**

- Separation of Flight and FlightInstance reflects real-world airline scheduling
- Critical business rules are enforced via validations and database constraints
