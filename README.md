# Hayai

Hayai is a lightweight Model-View-Controller framework that allows for navigation and
rendering of ERB templates, as well as database persistence and retrieval through the
custom MonoRM ORM library.

## How to Run

### Application Setup
Hayai requires the Ruby language, as well as git and the Bundler gem to be installed on the system.
The framework may be downloaded from github by running `git clone https://github.com/mc962/hayai.git`
Open a terminal window and navigate into the project directory
Run `bundle install` in the terminal and follow any directions given to you such as installing any requirements that are needed for the application to run.
After the system is setup, run the commands below in the terminal to get things started!

### Application Start
As a purely Ruby-based application, a Hayai server can be easily be launched by typing
Ruby *application_name*. The application may be tested by running `ruby bin/hayai.rb`.
If an error is thrown saying that no database is found, run the database setup using
`ruby db/db_setup.rb`.

### Interacting With Hayai

Hayai is capable of all 4 of the basic Create, Read, Update, and Destroy actions.

#### Demo App Instructions
The following are instructions for the demo app bundled into the this repository. After
the application is set up using the above listed commands, the demo app can be explored on the browser.

##### Main Page
Users may click on a dragon's name to see information for the dragon, or click `Hatch a Dragon!`
to create a new dragon.

##### Hatching a dragon (Create)
Users may create a dragon by entering the name, adding a url to the location where the picture is stored, and selecting a dragon's rider from the drop down list. Clicking `Hatch!` will send the inputted information to the database to be stored, and then will redirect to the the newly hatched dragon's page.

N.B. Dragon images that are stored locally should be placed in the public folder, and be given a picture url name of /public/<picture name>. The `krypto-pic.jpg` file is an extra picture that is in the public folder to demonstrate the create action.

##### Viewing a dragon (Read)
A dragon's information may be retrieved from the database and displayed on either the dragon's personal page, or as a list of pictures and names on the main index display of dragons. A dragon's show page will also contain it's rider, and some of its memories, pulled from the database through an association.

##### Changing a dragon (Update)
A dragon's information may be changed (which is especially useful for mislabeled picture urls),
by clicking`Change Me!`. This will take users to an edit form that will allow all the current dragon's attributes to be changed. When the user clicks `Change`, the changes will be sent to the database and the dragon will be updated. The user will then be redirected to the updated dragon's personal page.

##### Slaying a dragon (Destroy)
A dragon may be destroyed and deleted from the database by clicking the `Slay the Dragon` button on the dragon's personal page. The dragon will be immediately deleted from the database, and the user will be redirected to the main dragon list page. Be careful!

In the event that you delete something that you want back, and it was present in the original database seed file, then run `ruby db/db_setup.rb` again to reset the database back to its original state.

## Features

### ControllerBase

All controllers inherit from this base class. They make up the core of a web request in Hayai,
consisting of actions to be executed which may render a template or execute another action. The base controller is also able to handle Cross Site Request Forgery (CSRF) protection, by specifying `protect_from_forgery` in the child controller class.

### Router

The Router is responsible for writing new routes using received Regular Expression patterns.

### Flash

The Flash allos the user to display temporary messages through storage in a temporary cookie  `_hayai_app_flash` cookie. Information stored in Flash.now will persist for the current render cycle, while information stored in Flash will persist for the current and next render cycle.

### Session

The session utilizes a `_hayai_app` cookie to store persistent information relative to the session.

### Exceptions

### Static Assets

This middleware provides  the option to serve static assets including CSS, JavaScript, and images. A FileServer class is provided to serve the appropriate files, and is called in the event that a request comes through requesting a static asset.

## To-Dos

 - Finish documentation for ORM, Flash message, Exceptions, Static Assets, CSRF protection

 - Implement PostgreSQL connection capability for increased database support and ability for apps built with Hayai to be hosted on Heroku

 - Package Hayai into a gem for easy install and use.

 - Terminal Commands - Currently everything is only runnable as a standard Ruby script. As the framework is fleshed out, support will be added for various commands and basic generations such as migrations.

 - DOM Traversal/Manipulation - At the time of this writing there is also a lightweight DOM Traversal and Manipulation library under development. When completed it will also be integrated into Hayai.

 - Bonus - Add authentication to demo for CRUD actions
