# Hayai

Hayai is a lightweight View-Controller framework that allows for navigation and
rendering of ERB templates.

## How to Run

As a purely Ruby-based application, a Hayai server can be easily be launched by typing
Ruby *application_name*, in this repo one can test the controller capabilities by running
ruby dragons_controller.rb from the controllers directory.

### ControllerBase

All controllers inherit from this base class. They make up the core of a web request in Hayai,
consisting of actions to be executed which may render a template or execute another action.

### Router

The Router is responsible for writing new routes using received Regex patterns.

To-Dos

 - ORM - At the time of this writing, an ORM system is in production and nearly completed. Upon completion it will be incorporated into Hayai for a full MVC experience.

 - Terminal Commands - Currently everything is only runnable as a standard Ruby script. As the framework is fleshed out, support will be added for various commands and basic generations such as migrations.

 - DOM Traversal/Manipulation - At the time of this writing there is also a lightweight DOM Traversal and Manipulation framework under development. When completed it will also be integrated into Hayai.

 - Flash message - A hash-like object that persists until the end of the current or next render cycle, which is convenient for certain types of notifications.

 - Exceptions - Improve the basic Internal Server Error message with neatly formatted exceptions utilizing Rack Middleware.

 - Static assets - Add additional middleware to make static images, JavaScripts, and CSS assets available on the client side.

 - CSRF Protection - Add protection against Cross-Site-Request-Forgery.
