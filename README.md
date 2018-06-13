# WhimpleCC

In this project, I set out to redesign the website for a village cricket team using Ruby on Rails and basic front-end skills.

## Motivation  

As a cricket fan, I noticed that the majority of websites for village cricket clubs followed a format designed by the England and Wales Cricket Board('ECB'). Whilst the provision of a template makes financial sense and although the template is perfectly functional, there is little scope for personalisation or extension beyond the prescribed sections.

In many small villages around the country, a local cricket club already plays an important role in the community as a spot for local, like-minded sports fans to meet on a regular basis. However, in circumstances where clubs are increasingly seeking to promote their facilities for non-sporting events (weddings, parties etc) it has become vital that a club's website visually sells the club at the same time as providing all relevant sporting information.

## Build Status

The build status of the application will appear here.

## Screenshots

Screenshots of the completed application will appear here.

## Tech Used

#### Built With:
-   Ruby on Rails
-   sass-rails
-   BCrypt

#### Tested With:
-   rspec-rails
-   Capybara

## Features

## Installation

#### Prerequisites

The application uses a PostgreSQL database when run locally.  If you have not previously used PostgreSQL, follow [these instructions](https://www.postgresql.org/download/) to download and install it on your system.

#### Using the Application

The fastest way to use the site is to visit it [here.](https://dashboard.heroku.com/apps/bwk-cricket-club)

As an alternative, download the repository by navigating to an appropriate location on the command line and running:

    git clone https://github.com/bwk103/whimpleCC.git

Install the required dependencies by running:

    bundle install

Create the databases and migrate the schema:

    rails db:create
    rails db:migrate

Run the application:

    rails server

#### Running the Tests

If you wish to run all of the tests, navigate to the repository's root directory and run:

    rspec

## Credits

This is where the credits will go.
