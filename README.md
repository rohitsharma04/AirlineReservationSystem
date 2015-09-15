# J2EE Project -  Summer Training
Project Case Study
Airline Reservation System
 #
Airline Reservation System contains airline Schedules, fare tariffs, passenger reservations and ticket records. An airline system direct distribution works within their own reservation system. This project contains following modules:

# User Module #
Search for flight (Schedule) according to date, source and destination.
Reservation of ticket.
Cancellation of ticket.
Check PNR status.
Get fare for any source to destination of different classes for the particular flight.
Check the status of the flight that seats are available or not for particular flight and class.
Administrator Module
Add new flight details.
Cancel the flight if the flight can not be operate due to some reason.
Manage the schedule of flights and can alter the flight source and destination.
Admin can alter the arrival and departure time of flight and can change the days of flight.
NOTE : Maintain proper Validation, Authentication, and Authorization in         ARS(Airline Reservation System) Application.
Database Tables

ClassMaster 
Field Name
Description
ClassID
int(10) primary key
ClassName
Varchar(30)
Note: ClassName may be business, economic or first class. 
	
CompanyMaster
Field Name
Description
CompanyID
int(10) primary key
CompanyName
Varchar(30)
Note: CompanyName field contain the name of the company which flight is operated, like JetAirway, KingFisher etc.

AerodrumMaster
Field Name
Description
AerodrumID
int(10) primary key
AerodrumName
Varchar(40)
City
Varchar(30)
State
Varchar(30)
Note: AerodrumName field contain the name of the  Aerodrum from where the flight will be operate, like Indra Gandhi Internation Airport,Delhi etc

DayMaster
Field Name
Description
DayID
int(10) primary key
DayName
Varchar(30)
Note: DayName field contain the name of the weekdays. 
FlightMaster
Field Name
Description
FlightNo
int(10)  primary key
FlightName
Varchar(30)
CompanyId
int(10) foreign key
SourceId
int(10) foreign key
DestinationId
int(10) foreign key
DepartureTime
Time
ArrivalTime
Time
Note: CompanyId  will map with the CompanyMaster table.
SourceId and DestinationId will be mapped with the AerodrumMaster table. 

 FlightFareMap
Field Name
Description
FFId
int(10) primary key
FlightNo
Int(10) foreign key
ClassId
Int(10) foreign key
NoOfSeats
Int(10)
Fare
Int(10)
Note :  FlightNo field  will be mapped with FlightMaster table.
	 ClassId field will be mapped with ClassMaster table.

FlightDayMap
Field Name
Description
FDId
Int(10) primary key
FlightNo
Int(10) foreign key
DayId
Int(10) foreign key
Note :  FlightNo field  will be mapped  with the FlightMaster table.
	 DayId field will be mapped the DayMaster table.

AdminDetails
Field Name
Description
AdminID
Int(10)  primary key
AdminName
Varchar (30)
Password
Varchar (10)
Note :  AdminName field contain the name of the administrator. And only the  
administrator can use the admin module. And the user module can be view to any of the user.

CustomerDetails
Field Name
Description
PNRNo
Int(10)  primary key
PassportId
Varchar (30)
CustomerName
Varchar (30)
Age
Int(3)
Gender
Varchar(10)
City
Varchar(30)
EMailId
Varchar(30)
ContactNo
Varchar(20)
ClassId
Int(10) foreign key
FlightNo
Int(10) foreign key
Note :  ClassId field will be mapped with the ClassMaster table.
	 FlightNo field will be mapped with the FlightMaster table.




#Description: #

#Admin Module: #

1. Add New Flight Details :
Create a form for administrator to add new flight. And insert new entry on FlightMaster table. This form has three combos, one for selection of service Provider Company and two for source and destination aero drum.
2. Cancel the Flight:
Create a form where all flight no display on the combo and the admin can select any flight and can delete any of the flight from the FlightMaster table which cannot be operated in future.

# User Module: #

1. Search For flight (Schedule):
Create a form where the user can search any flight on particular date and also can search for all the flight for the particular source to the particular destination. In this form create a link to get availability status of seats in different class.
2. Reservation Of Tickets:
Create a form for insert the customer details in CustomeeDetail table. And provide the PNR no and seat no to customer if available.  
3. Cancellation of Tickets:
Create a form where user can enter his/her PNR no and can cancel their ticket. Firstly check the availability of the PNR and the cancel the ticket for customer and refund the money.
4. Check PNR Status:
In this form user can enter the PNR number & and view its ticket details seat no, class etc.
5. Get Fare:
In this form the user can get the fare details from its source to destination according to the class (1st class, Business class or Economy class).
6. Flight Status:
The user, in this form, can get the flight status (flight number, flight name, arrival time, departure time, date, seat availability etc).





##Tools & Technology##
Technology : 
Server Side : Java(JDK7.0), Servlet2.4, JSP2.0, EL, JSTL
Client Side : HTML, JavaScript, CSS
Database : MySQL 5.0
Framework : Hibernate ORM .
IDE : NetBeans 8.02.


##Application Developers :##
### Rohit Sharma ###.
### Sakshi Maskara ###.