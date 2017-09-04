# Ukrmap
  Rube's version 2.3.1
  Rail's version 5.0.1

## Install Instructions

### Installation

1. Clone repository:

    $git clone https://github.com/ukrmap/ukrmap_rails.git

2. Change directory:

    $cd ukrmaps_rails

3. Install gems:

    $gem install bundler --no-ri --no-rdoc

then type below:

    $bundle install

### Setup Database

1. Create db:

    $rake db:create

2. Do migration db:

    $rake db:migrate

3. Load the seed data:

    $rake db:seed
