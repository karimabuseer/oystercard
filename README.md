# Oystercard README
### About the project
This project is the completed afternoon final challenge for Makers Academy week 2. The main object of the project, 'Oystercard' is meant to replicate the functionality of a TransportForLondon Oystercard; a prepaid cash card that allows transit on public transport in London.

### Learning objectives
Primary focuses of the project are on practicing Extract Class refactoring, as well as method refactoring to satsify SOLID principles - particularly the interface segregation principle, and the single responsibility principle. The presence of several depedent objects also allowed some areas in which to practice dependency injections, with an eye on the dependency inversion principle.

The project has also provided a good opportunity for teesting frameworks - particularly at mocking within tests.
### Usage
The Oystercard class is the only class the user needs to interact with; to interact with the program, run the file using a Ruby interpreter from your command line. A float or int can be provided to the .top_up method to provide the card with a balance. The .touch_in and .touch_out methods replicate entering and exiting the station, and should be provided two positional arguments - the first being a String that represents the name of the station, the first second being an Integer that represents the zone of the station. The zone allows the card to be charged for the correct amiohnt (checked via .balance). Prior journets can be checked using .journeys. Tests can be called by installing rspec, then navigating to the parent directory and running rspec in the command line.

### Built-with
The code is entirely written in Ruby, and was compiled during testing using Ruby 3.0.0. Automated tests are written using rspec. Format checking utilised rubocop. 