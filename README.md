
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">

  <h3 align="center">Whether, Sweater?</h3>

</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#endpoints">Endpoints</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#setup">Setup</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#project_configurations">Project Configurations</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Whether, Sweater? is a 5 day solo project during Mod 3 of 4 for Turing School's Back End Engineering Program.

The objective of Whether, Sweater? is to expose an API for a front-end team to consume in a service-oriented architecture. The app is for planning road trips and allows a user to have weather information for the current location and destination.

Learning Goals:
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

### Endpoints

| route | description |
|-------|-------------|
| GET /api/v1/forecast?location=LOCATION | Get forecast information for a specific location |
| GET /api/v1/background?location=LOCATION | Get a background image for a specific location |
| POST /api/v1/users | Enter email, password, and password confirmation to create a new user |
| POST /api/v1/sessions | Return user along with api key from login information |
| POST /api/v1/road_trip | Enter origin and destination to receive road trip information |

### Built With

* Ruby 2.7.2
* Rails 5.2.6
* PostgreSQL
* RSpec
* SimpleCov
* Factory Bot/Faker
* Fast JSON API
* Rubocop



<!-- GETTING STARTED -->
## Setup

This project requires Ruby 2.7.2.

### Installation

1. Fork this repository
2. Clone the fork
3. From the command line, install gems and set up your DB:
   * `bundle install`
   * `rails db:{create,migrate,seed}`
4. Run the test suite with bundle exec rspec.
5. Run your development server with rails s to see the app in action.

#### Project Configurations

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System dependencies](https://github.com/amcguire17/whether_sweater/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:{drop,create,migrate}
    Created database 'wether_sweater_development'
    Created database 'wether_sweater_test'
    ```

* How to run the test suite
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop

    ```

<!-- CONTACT -->
## Contact

[Amanda McGuire](https://github.com/amcguire17)

Project Link: [Whether, Sweater?](https://github.com/amcguire17/whether_sweater)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/amcguire17/whether_sweater.svg?style=for-the-badge
[contributors-url]: https://github.com/amcguire17/whether_sweater
[forks-shield]: https://img.shields.io/github/forks/amcguire17/whether_sweater.svg?style=for-the-badge
[forks-url]: https://github.com/amcguire17/whether_sweater/network/members
[stars-shield]: https://img.shields.io/github/stars/amcguire17/whether_sweater.svg?style=for-the-badge
[stars-url]: https://github.com/amcguire17/whether_sweater/stargazers
[issues-shield]: https://img.shields.io/github/issues/amcguire17/whether_sweater.svg?style=for-the-badge
[issues-url]: https://github.com/amcguire17/whether_sweater/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/amanda-e-mcguire/
