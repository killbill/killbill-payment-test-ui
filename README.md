Overview
========

Rails mountable engine to manage the payment-test plugin.

See [killbill-admin-ui-standalone](https://github.com/killbill/killbill-admin-ui-standalone) to get started with the Kill Bill Admin UI.

Kill Bill compatibility
-----------------------

| KPM UI version | Kill Bill version |
|---------------:|------------------:|
|          0.0.y |  0.18.z (Rails 4) |
|          0.1.y |  0.18.z (Rails 5) |
|          1.x.y |  0.20.z (Rails 5) |
|          2.0.y |  0.22.z (Rails 5) |
|          2.1.y |  0.24.z (Rails 6) |
|          3.x.y |  0.24.z (Rails 7) |

Testing
-------

To run the dummy app:

```
rails s
```


To run tests:

```
rails t
```

This plugin is using [killbill-assets-ui](https://github.com/killbill/killbill-assets-ui) to load the common assets.
If you want to override the assets you can add it to ```app/assets/stylesheet/payment-test``` or ```app/assets/javascripts/payment-test```

For integrate run with [killbill-admin-ui-standalone](https://github.com/killbill/killbill-admin-ui-standalone), please update the Gemfile to use killbill-payment-test-ui locally

```
# gem 'killbill-payment-test-ui'
gem 'killbill-payment-test-ui', :path => '../killbill-payment-test-ui'
```
