# Soundcloud APP

This application allows you to synchronize tracks and playlists with your account Soundcloud. The application also syncs Soundcloud profile (login name, avatar, and so on.)

## Tech
Soundcloud App requires:

* [PostgreSQL](https://www.postgresql.org/) version 9.5.4 or higher
* [Rails](http://rubyonrails.org/) version 5.0.0 or higher
* [Redis](http://redis.io/) version 3.2.3 or higher
* [Ruby](http://www.ruby-lang.org/) version 2.3.0 or higher

Soundcloud App uses a number of open source projects to work properly:

* [Devise](https://github.com/plataformatec/devise) - flexible authentication solution for Rails based on Warden
* [Dragonfly](https://github.com/markevans/dragonfly) - highly customizable ruby gem for handling images and other attachments
* [jQuery] - duh
* [node.js] - evented I/O for the backend
* [Sidekiq](https://github.com/mperham/sidekiq) - simple, efficient background processing for Ruby
* [Twitter Bootstrap] - great UI boilerplate for modern web apps

## Installation

#### Install RVM (Ruby Version Manager):

* MacOS or OS X

   ```sh
    brew install gnupg
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
   ```

* Ubuntu

    ```sh
    sudo apt-add-repository ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt-get install rvm
    ```

#### Install Rails:

```sh
gem install rails --version=5.0.0
```

#### Install PostgreSQL:

* MacOS or OS X

   ```sh
   brew update
   brew install postgresql
   ```

* Ubuntu

    ```sh
    sudo apt-get update
    sudo apt-get install postgresql postgresql-contrib
    ```

#### Create a New Role in PostgreSQL:

The installation procedure created a user account called `postgres` that is associated with the default Postgres role.  In order to use Postgres, we'll need to log into that account and create role that will have the same name as your username in the system. You can do that by typing:

``` sh
sudo -i -u postgres
createuser --interactive
```

#### Install Redis:

* MacOS or OS X

   ```sh
   brew install redis
   ```

* Ubuntu

    In order to get the latest version of Redis, we will be compiling and installing the software from source. Before we     download the code, we need to satisfy the build dependencies so that we can compile the software.
    We can update our local apt package cache and install the dependencies by typing:

    ```sh
    sudo apt-get update
    sudo apt-get install build-essential tcl
    ```
    Now, download the latest stable version of Redis. This is always available at a stable [download URL](http://download.redis.io/redis-stable.tar.gz):

    ```sh
    curl -O http://download.redis.io/redis-stable.tar.gz
    ```

    Unpack the tarball by typing:

    ```sh
    tar xzvf redis-stable.tar.gz
    ```

    Move into the Redis source directory structure that was just extracted:

    ```sh
    cd redis-stable
    ```

    Now, we can compile the Redis binaries and run the test suite to make sure everything was built correctly by typing:

    ```sh
    make && make test
    ```

    This will typically take a few minutes to run. Once it is complete, you can install the binaries onto the system by typing:

    ```sh
    sudo make install
    ```

## Download

Clone the application on your local computer by running the following command in your Terminal:

```sh
 git clone git@github.com:Andry75/Soundcloud_App.git project_name
```

## Register a new SoundCloud application

1. Make sure you're [signed up](http://soundcloud.com/signup) for SoundCloud and logged in.
2. [Go here](http://soundcloud.com/you/apps), register a new application, using `http://localhost:3000/soundcloud/oauth-callback` for  'Redirect URI for Authentication'
3. Copy the `Client ID` and `Client Secret` to a text file for later

## Configuration

1. Create a new file `env.yml` in directory `config`
2. In file `env.yml` paste your `Client ID` and `Client Secret`, it should look like this:

    ```ruby
    SOUNDCLOUD_CLIENT_ID: 'Your Client ID'
    SOUNDCLOUD_CLIENT_SECRET: 'Your Client Secret'
    ```

## Before the first launch of application

In the application directory, running the following commands in your Terminal:

```sh
bundle install
rails db:create
rails db:migrate
```

## Run Application

To run application,  running the following command in your Terminal:

* In the first Terminal:

    ```sh
    bundle exec sidekiq
    ```

* In the second Terminal:

    ```sh
    rails s
    ```

## Todos

 - Write Tests

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [@thomasfuchs]: <http://twitter.com/thomasfuchs>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [keymaster.js]: <https://github.com/madrobby/keymaster>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]:  <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
