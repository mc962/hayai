# Hayai

Hayai is a lightweight Model-View-Controller framework that allows for navigation and
rendering of ERB templates.

## How to Run

As a purely Ruby-based application, a Hayai server can be easily be launched by typing
Ruby *application_name*. The application may be tested by running `ruby bin/hayai.rb`.
If an error is thrown saying that no database is found, run the database setup using
`ruby db/db_setup.rb`.

### ControllerBase

All controllers inherit from this base class. They make up the core of a web request in Hayai,
consisting of actions to be executed which may render a template or execute another action.

### Router

The Router is responsible for writing new routes using received Regular Expression patterns.

### To-Dos

 - Finish documentation for ORM, Flash message, Exceptions, Static Assets, CSRF protection

 - Add views and controller actions for basic CRUD to demo

 - Terminal Commands - Currently everything is only runnable as a standard Ruby script. As the framework is fleshed out, support will be added for various commands and basic generations such as migrations.

 - DOM Traversal/Manipulation - At the time of this writing there is also a lightweight DOM Traversal and Manipulation library under development. When completed it will also be integrated into Hayai.

 - Bonus - Add authentication to demo for CRUD actions
