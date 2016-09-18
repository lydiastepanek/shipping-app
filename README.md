# ShipmentsApp

In this app, the shipments controller handles creation of shipments. Shipments
are made of inventory items and belong to the warehouse that assembles them.

Ruby version
2.2.4

To run locally:

* bundle install
* bundle exec rake db:create db:migrate db:seed
* rails server

To run the test suite:

* rbbe rake spec
