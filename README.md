<div align="center">
<h1><a href="https://appwebtech-machax.herokuapp.com/">Machax Tech Hub</a></h1> 
<h1>Software Development Documentation</h1>
  

<div align="center">
  <sub>Built by
  <a href="https://github.com/appwebtech">Joseph M Mwania</a>
    
  </a>
</div>
</sub>
</div>

<h2>Table of Contents</h2>

- [Introduction](#introduction)
- [CORS](#cors)
- [What the app should do ](#what-the-app-should-do )
- [Technologies](#technologies)
  - [Bulma rails](#bulma-rails)
    - [Installation](#installation)
    - [Usage](#usage)
  - [Devise](#devise)
  - [Carrierwave](#carrierwave)
    - [carrierwave version disclaimer](#carrierwave-version-disclaimer)
    - [Information](#information)
    - [Getting Help](#getting-help)
    - [Installation](#installation)
  - [Simple Form](#simple-form)
    - [Installation](#installation)
  - [MiniMagick](#minimagick)
    - [Why](#why)
    - [Solution](#solution)
  - [Impressionist](#impressionist)
    - [What does this thing do](#what-does-this-thing-do)
    - [What about bots](#what-about-bots)
    - [Installation](#installation)
  - [jQuery-rails](#jquery-rails)
    - [Versions](#versions)
    - [Installation](#installation)
  - [Gravatar Image Tag](#gravatar-image-tag )
    - [Gravatar Image Tag Plugin](#gravatar-image-tag-plugin)
    - [Install as a Ruby Gem](#install-as-a-ruby-gem)
      - [Rails 2](#Rails-2)
      - [Rails 3 ~> 5](#Rails-3-~>-5)
  - [Acts As Votable](#acts-as-votable)
    - [Installation](#installation)
    - [Supported Ruby and Rails versions](#supported-ruby-and-rails-versions)
    - [Install](#install)
    - [Database Migrations](#database-migrations)
  - [Fog Aws](#fog-aws)
- [Developer](#developer)
- [Contacts](#contacts)
- [License](#license)


# Introduction

This a Ruby on Rails Application that I've been developing from bottom to top and I'll briefly go through the Technical and Deployment Architectures. The former encompasses Layers and Capabilities and Technologies whilst the latter is more on API and Database and Web Client. I lost the footer code and other minor instances whilst doing a recursive git merge on a train but that would be easy to add anyway. Just create a partial with your code and parse it in the layout file.

The main Controller which I generated with a scaffold has both HTML & JSON capabilities and can be extended to an API by whomever is willing to fork the project and do that. Chances of me doing that as of now are next to a camel going through the eye of a needle as I have a demanding day job with other technologies to work on in the evenings (but I'll never abandon Ruby just for the record). 

On the RDBMS, I've used SQLite for development and PostgreSQL (PG) for deployment. SQLite is ideal for applications with a low dependency on SQL constructs while PG is a fully supported production DB. Because Rails 5 ships with a native SQLite3, many developers use this approach and later change to PG when deploying. Actually, it's possible to use PG natively both in Dev and Prod mode. 

I was thinking of deploying an end-to-end application that I used in this approach but then it has Rspec test files and other personal coding techniques that I wouldn't like to push in the public domain. Anyways, the app is scalable and MongoDB (No SQL) which uses Mongoid as the **Object Document Mapper** can be integrated for a Bigdata API flavor. As of now, the app's DB interface is ActiveRecord which uses **Object Relational Mapper**.

# CORS
I've implemented the app to comply with the browser requirement of same origin policy; I've also implemented some **Cross-Origin Resource Sharing** with the server. This is vital if you want a dual deployment approach, where the server is deployed to Heroku and the UI is deployed to GitHub. Even though I have an Heroku deployment, I've used an 'hybrid' approach to get images served by [Amazon Web Services](http://console.aws.amazon.com/) (AWS). 

If an app is compiled locally and pushed to Heroku via Git, the images reside within the app and Heroku servers I presume cannot detect them (If you use this trick to host your files just remember to buy me some coffee by clicking [here](https://www.buymeacoffee.com/josembi)). Any other images added externally to the app are tracked by Herokus algorithms and deleated after an hour or so. Now that I mentioned the coffee thing, I do some projects pro-bono and if a gift were to be made directly to my paypal account, it would seem different to Big Brother but I have that almost sorted out anyways.

# Alternate Web Servers
Rails (Rack) web servers are Modular Web Servers Interfaces used by Ruby-based frameworks, including rails. In the past I've installed, ran and tested the following:

* Webrick
* Phusion Passenger
* Thin
* Unicorn
* Puma

Puma is recommended due to its full fledge production capabilities and Postgress DB interactability at the Heroku cloud servers. I prefer Webrick (single threaded and amazing at debugging) for development, but for the sake of consistency, I've used Puma through out. Some people have written asking that I screencast tutorials, which I may possibly do towards the end of the year and hopefully upload them to [udemy](https://www.udemy.com/). I'll add a blog section to my website and run tutorials there as well but without video footage. 

# What the app should do 
Users should be able to register in the app, then chose a tech of their choice and create comments. I didn't use [Action Cable](http://edgeguides.rubyonrails.org/action_cable_overview.html) as I didn't have time to do that, but I have added analytics which are visible on the UI so you can see who the number of *views*, *comments* and *likes* without actually tracking the user. 

Associations that I added within the model will create logical restrictions so that only a user can use [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) to manipulate his/her own comments, files etc leaving the others intact. 


# Technologies 


## Bulma-rails

Integrates [Bulma](http://bulma.io/) with the rails asset pipeline.

A modern CSS framework based on Flexbox.

### Installation

Add this line to your application's Gemfile:

    gem "bulma-rails", "~> 0.6.2"

And then execute:

    $ bundle

### Usage

To import all assets in your Rails project, add the following line to your application.scss:
``` ruby
@import "bulma";
```

For information about customizing Bulma,
see: [http://bulma.io/documentation/overview/start/](http://bulma.io/documentation/overview/start/)

## Devise

![Devise Logo](https://raw.github.com/plataformatec/devise/master/devise.png)

By [Plataformatec](http://plataformatec.com.br/).

[![Build Status](https://api.travis-ci.org/plataformatec/devise.svg?branch=master)](http://travis-ci.org/plataformatec/devise)
[![Code Climate](https://codeclimate.com/github/plataformatec/devise.svg)](https://codeclimate.com/github/plataformatec/devise)

This README is [also available in a friendly navigable format](http://devise.plataformatec.com.br/).

Devise is a flexible authentication solution for Rails based on Warden. It:

* Is Rack based;
* Is a complete MVC solution based on Rails engines;
* Allows you to have multiple models signed in at the same time;
* Is based on a modularity concept: use only what you really need.

It's composed of 10 modules:

* [Database Authenticatable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/DatabaseAuthenticatable): hashes and stores a password in the database to validate the authenticity of a user while signing in. The authentication can be done both through POST requests or HTTP Basic Authentication.
* [Omniauthable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Omniauthable): adds OmniAuth (https://github.com/omniauth/omniauth) support.
* [Confirmable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Confirmable): sends emails with confirmation instructions and verifies whether an account is already confirmed during sign in.
* [Recoverable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Recoverable): resets the user password and sends reset instructions.
* [Registerable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Registerable): handles signing up users through a registration process, also allowing them to edit and destroy their account.
* [Rememberable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Rememberable): manages generating and clearing a token for remembering the user from a saved cookie.
* [Trackable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Trackable): tracks sign in count, timestamps and IP address.
* [Timeoutable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Timeoutable): expires sessions that have not been active in a specified period of time.
* [Validatable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Validatable): provides validations of email and password. It's optional and can be customized, so you're able to define your own validations.
* [Lockable](http://rubydoc.info/github/plataformatec/devise/master/Devise/Models/Lockable): locks an account after a specified number of failed sign-in attempts. Can unlock via email or after a specified time period.

## CarrierWave

This gem provides a simple and extremely flexible way to upload files from Ruby applications.
It works well with Rack based web applications, such as Ruby on Rails.

[![Build Status](https://travis-ci.org/carrierwaveuploader/carrierwave.svg?branch=master)](http://travis-ci.org/carrierwaveuploader/carrierwave)
[![Code Climate](http://img.shields.io/codeclimate/github/carrierwaveuploader/carrierwave.svg)](https://codeclimate.com/github/carrierwaveuploader/carrierwave)
[![git.legal](https://git.legal/projects/1363/badge.svg "Number of libraries approved")](https://git.legal/projects/1363)


> ### carrierwave version disclaimer
> ***This README is for a branch which is still in development.
> Please switch to latest `0.x` branch for stable version.***


### Information

* RDoc documentation [available on RubyDoc.info](http://rubydoc.info/gems/carrierwave/frames)
* Source code [available on GitHub](http://github.com/carrierwaveuploader/carrierwave)
* More information, known limitations, and how-tos [available on the wiki](https://github.com/carrierwaveuploader/carrierwave/wiki)

### Getting Help

* Please ask the community on [Stack Overflow](http://stackoverflow.com/) for help if you have any questions. Please do not post usage questions on the issue tracker.
* Please report bugs on the [issue tracker](http://github.com/carrierwaveuploader/carrierwave/issues) but read the "getting help" section in the wiki first.

### Installation

Install the latest release:

```
$ gem install carrierwave -v "1.0.0.beta"
```

In Rails, add it to your Gemfile:

```ruby
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'
```

Finally, restart the server to apply the changes.

As of version 1.0.0 (forthcoming), CarrierWave requires Rails 4.0 or higher and Ruby 2.0
or higher. If you're on Rails 3, you should use v0.11.0.

## Simple Form

![Simple Form Logo](https://raw.github.com/plataformatec/simple_form/master/simple_form.png)

By [Plataformatec](http://plataformatec.com.br/).

Rails forms made easy.

**Simple Form** aims to be as flexible as possible while helping you with powerful components to create
your forms. The basic goal of **Simple Form** is to not touch your way of defining the layout, letting
you find the better design for your eyes. Most of the DSL was inherited from Formtastic,
which we are thankful for and should make you feel right at home.

INFO: This README is [also available in a friendly navigable format](http://simple-form.plataformatec.com.br/)
and refers to **Simple Form** 3.1. For older releases, check the related branch for your version.

### Installation

Add it to your Gemfile:

```ruby
gem 'simple_form'
```

Run the following command to install it:

```console
bundle install
```

Run the generator:

```console
rails generate simple_form:install
```


## MiniMagick

[![Build Status](https://travis-ci.org/minimagick/minimagick.svg?branch=master)](http://travis-ci.org/minimagick/minimagick)
[![Code Climate](https://codeclimate.com/github/minimagick/minimagick/badges/gpa.svg)](https://codeclimate.com/github/minimagick/minimagick)

A ruby wrapper for [ImageMagick](http://imagemagick.org/) or
[GraphicsMagick](http://www.graphicsmagick.org/) command line.

### Why?

I was using [RMagick](https://github.com/rmagick/rmagick) and loving it, but it
was eating up huge amounts of memory. Even a simple script would use over 100MB
of RAM. On my local machine this wasn't a problem, but on my hosting server the
ruby apps would crash because of their 100MB memory limit.

### Solution!

Using MiniMagick the ruby processes memory remains small (it spawns
ImageMagick's command line program mogrify which takes up some memory as well,
but is much smaller compared to RMagick). See [Thinking of switching from
RMagick?](#thinking-of-switching-from-rmagick) below.

MiniMagick gives you access to all the command line options ImageMagick has
(found [here](http://www.imagemagick.org/script/command-line-options.php)).

## Impressionist 

![Impressionist Logo](https://github.com/charlotte-ruby/impressionist/raw/master/logo.png)

[![Build Status](https://secure.travis-ci.org/charlotte-ruby/impressionist.png?branch=master)](http://travis-ci.org/charlotte-ruby/impressionist)
[![Code Climate](https://codeclimate.com/github/charlotte-ruby/impressionist.png)](https://codeclimate.com/github/charlotte-ruby/impressionist)


A lightweight plugin that logs impressions per action or manually per model


## What does this thing do?

Logs an impression... and I use that term loosely.  It can log page impressions
(technically action impressions), but it is not limited to that. You can log
impressions multiple times per request.  And you can also attach it to a model.
The goal of this project is to provide customizable stats that are immediately
accessible in your application as opposed to using Google Analytics and pulling
data using their API.  You can attach custom messages to impressions.  No
reporting yet.. this thingy just creates the data.

## What about bots?

They are ignored.  1200 known bots have been added to the ignore list as of
February 1, 2011.  Impressionist uses this list:
http://www.user-agents.org/allagents.xml

## Installation

Add it to your Gemfile

    gem 'impressionist'

Install with Bundler

    bundle install

Generate the impressions table migration

    rails g impressionist

Run the migration

    rake db:migrate

The following fields are provided in the migration:

    t.string   "impressionable_type"  # model type: Widget
    t.integer  "impressionable_id"    # model instance ID: @widget.id
    t.integer  "user_id"              # automatically logs @current_user.id
    t.string   "controller_name"      # logs the controller name
    t.string   "action_name"          # logs the action_name
    t.string   "view_name"            # TODO: log individual views (as well as partials and nested partials)
    t.string   "request_hash"         # unique ID per request, in case you want to log multiple impressions and group them
    t.string   "session_hash"         # logs the rails session
    t.string   "ip_address"           # request.remote_ip
    t.text     "params"               # request.params, except action name, controller name and resource id
    t.string   "referrer"             # request.referer
    t.string   "message"              # custom message you can add
    t.datetime "created_at"           # I am not sure what this is.... Any clue?
    t.datetime "updated_at"           # never seen this one before either....  Your guess is as good as mine?? ;-)


## jQuery-rails

jQuery! For Rails! So great.

This gem provides:

  * jQuery 1, 2 and 3
  * the jQuery UJS adapter
  * assert_select_jquery to test jQuery responses in Ruby tests

### Versions

Starting with v2.1, the jquery-rails gem follows these version guidelines
to provide more control over your app's jQuery version from your Gemfile:

```
patch version bump = updates to jquery-ujs, jquery-rails, and patch-level updates to jQuery
minor version bump = minor-level updates to jQuery
major version bump = major-level updates to jQuery and updates to Rails which may be backwards-incompatible
```

See [VERSIONS.md](VERSIONS.md) to see which versions of jquery-rails bundle which
versions of jQuery.

### Installation

The jquery and jquery-ujs files will be added to the asset pipeline and available for you to use. If they're not already in `app/assets/javascripts/application.js` by default, add these lines:

```js
//= require jquery
//= require jquery_ujs
```

If you are running Rails 5.1 and up, and if you have included `//= require rails-ujs`, then `jquery_ujs` is not needed anymore. You can just add:

```js
//= require jquery
```

If you want to use jQuery 2, you can require `jquery2` instead:

```js
//= require jquery2
//= require jquery_ujs
```

And if you want to use jQuery 3, you can require `jquery3`:

```js
//= require jquery3
//= require jquery_ujs
```

For jQuery UI, we recommend the [jquery-ui-rails](https://github.com/joliss/jquery-ui-rails) gem, as it includes the jquery-ui css and allows easier customization.

*As of v3.0, jquery-rails no longer includes jQuery UI. Use the
jquery-ui-rails gem above.*

## Gravatar Image Tag 

![Gravatar Logo](http://s.gravatar.com/images/logo.png)

### Gravatar Image Tag Plugin

Rails view helper for grabbing [Gravatar](http://en.gravatar.com/) images.  The goal here is to be configurable and have those configuration points documented!

### Install as a Ruby Gem

#### Rails 2

Include the following line in your Rails environment

```shell
config/environment
  config.gem 'gravatar_image_tag'
```

Then ensure the gem is installed by running the following rake task from the your application root.

```shell
rake gems:install
```

#### Rails 3 ~> 5

Include the following line in your Rails environment

```shell
 Gemfile
  gem 'gravatar_image_tag'
```
p. Then ensure the gem is installed by running the following command from the application root.

```shell
bundle install
```

## Acts As Votable

[![Build Status](https://travis-ci.org/ryanto/acts_as_votable.svg?branch=master)](https://travis-ci.org/ryanto/acts_as_votable)
[![Code Climate](https://codeclimate.com/github/ryanto/acts_as_votable.png)](https://codeclimate.com/github/ryanto/acts_as_votable)

Acts As Votable is a Ruby Gem specifically written for Rails/ActiveRecord models.
The main goals of this gem are:

- Allow any model to be voted on, like/dislike, upvote/downvote, etc.
- Allow any model to be voted under arbitrary scopes.
- Allow any model to vote.  In other words, votes do not have to come from a user,
  they can come from any model (such as a Group or Team).
- Provide an easy to write/read syntax.

### Installation

### Supported Ruby and Rails versions

* Ruby 2.2.0, 2.3.0 and 2.4.0
* Rails 4.0, 4.1+
* Rails 5.0, 5.1

### Install

Just add the following to your Gemfile to install the latest release.

```ruby
gem 'acts_as_votable', '~> 0.11.1'
```

And follow that up with a ``bundle install``.

### Database Migrations

Acts As Votable uses a votes table to store all voting information.  To
generate and run the migration just use.

    rails generate acts_as_votable:migration
    rake db:migrate

You will get a performance increase by adding in cached columns to your model's
tables.  You will have to do this manually through your own migrations.  See the
caching section of this document for more information.

## Fog::Aws

![Gem Version](https://badge.fury.io/rb/fog-aws.svg)
[![Build Status](https://travis-ci.org/fog/fog-aws.svg?branch=master)](https://travis-ci.org/fog/fog-aws)
[![Dependency Status](https://gemnasium.com/fog/fog-aws.svg)](https://gemnasium.com/fog/fog-aws)
[![Test Coverage](https://codeclimate.com/github/fog/fog-aws/badges/coverage.svg)](https://codeclimate.com/github/fog/fog-aws)
[![Code Climate](https://codeclimate.com/github/fog/fog-aws.svg)](https://codeclimate.com/github/fog/fog-aws)


### Installation

Add this line to your application's Gemfile:

```ruby
gem 'fog-aws'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fog-aws



# Developer

Joseph Mwania

# Contacts

[GitHub](https://github.com/appwebtech)

[Appwebtech](http://www.theappwebtech.com/)

[Twitter](https://twitter.com/appwebtech)

[Facebook](https://www.facebook.com/appwebtech/)

[Pinterest](https://it.pinterest.com/appwebtech/)

[Google +](https://plus.google.com/u/1/104000565731100573953)

[LinkedIn](https://www.linkedin.com/company/18389649/admin/updates/)

# License

Available as open source under [MIT License](https://opensource.org/licenses/MIT)