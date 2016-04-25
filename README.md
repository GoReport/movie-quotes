# GoReport Developer Test

This API is available to any developer that wishes to apply for a role at GoReport.  It should be possible to complete the task in 2-3 hours however applicants are free to take a long as they require.  The applicant is free to use whatever Internet resources, 3rd party libraries or frameworks they wish to complete the task.

If you have any questions or queries please contact us at jobs@goreport.net.  Completed tests should be sent to jobs@goreport.net either as Git repo links or zip files.

## Movie Quotes API

The api can be found here

    http://movie-quotes-2.herokuapp.com/api/v1

with the following endpoints available

    GET /quotes
    GET /quotes/:id
    GET /quotes/random

example calls would be

    http://movie-quotes-2.herokuapp.com/api/v1/quotes
    http://movie-quotes-2.herokuapp.com/api/v1/quotes/1

This repo contains all the code for the API and a [Vagrant](http://www.vagrantup.com/) file if you wish to create a test server for development.

## iOS Developers Task

Using the API detailed above, create an iOS application (iPhone only, not universal) with the functionality listed below. The application must be created using Objective-C.

* The ability to display a random movie quote
* The ability to display a list of movie quotes
* The ability to show a single movie quote

The solution should take into consideration

* The testability of the app
* The ability to change the web service location and structure with minimal impact on the code base

## Web Developers Task

Using the API detailed above, create a web application with the functionality listed below. The web application must be created using JavaScript, the use of Angular is encouraged but plain jQuery or another framework such as React, Ember or Knockout is allowed.

* The ability to show a list of movie quotes
* The ability to show a single movie quote
* The ability to display a random movie quote

The solution should take into consideration

* Accessibility from various devices (computer, tablet, phone)
* The testability of the web app
* The ability to change the web service location and structure with minimal impact on the code base