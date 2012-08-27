[![Build Status](https://secure.travis-ci.org/rantav/onering.png?branch=master)](http://travis-ci.org/rantav/onering)
Setup:
=
- git: http://git-scm.com/download
- Ruby and rails: http://rubyonrails.org/download (use Ruby 1.9.2)
- Mongo: http://www.mongodb.org/display/DOCS/Quickstart (install mongo on the same server as the rails app, it's the easy way... otherwise you'd have to provide configuration URLs for the DB)

Setup Highlights
=
- install rvm: https://rvm.io/rvm/install/
- bundle install
- gem install foreman # make sure you're installing into a decent rvm environment
... this needs more work...


Clone:
=

    $ git clone git@github.com:rantav/onering.git

Test:
=

    $ bundle exec rspec spec

Configure:
=
- bundle exec rake db:seed

Run the server:
=
Production:

    $ RAILS_ENV=production foreman start

