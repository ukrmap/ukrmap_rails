# Ukrmap Rails [![Build Status](https://travis-ci.org/ukrmap/ukrmap_rails.svg?branch=master)](https://travis-ci.org/ukrmap/ukrmap_rails)
  Ruby on Rails version of http://ukrmap.su

## Install Instructions

### Installation

Clone repository:

```sh
$ git clone https://github.com/ukrmap/ukrmap_rails.git
```

Change directory:

```sh
$ cd ukrmap_rails
```

Install gems:

```sh
$ gem install bundler --no-ri --no-rdoc

$ bundle install
```

### Setup Database

Create db:

```sh
$ rails db:create
```

Do migration db:

```sh
$ rails db:migrate
```

Load the seed data:

```sh
$ rails db:seed
```
