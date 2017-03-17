# cams

This app aims to provide to residents of private apartments fuss-free facility booking and guest entry.

## Getting Started

Clone and bundle install.
On the CLI, run

```
rails db:setup
```

### Dependencies

* Ruby
* NodeMCU microcontroller (used with the MQTT gem)
* Any QR code reader/decoder


### How to Use

Log in with test123@test123.com, password: 123456 (non-administrator account).

Create bookings for various facility types, or generate a qr code to grant gate access to your guests. The qr code is sent to your personal email account, which you can then forward to your guests. Present it at the gate to open.


## Tests

Pending.


## Live Version

Find our app on Heroku [here](https://floating-ravine-65207.herokuapp.com/)

## Built With

What did you use to build it, list the technologies, plugins, gems, packages etc.
* [Ruby on Rails](https://rubyonrails.org/)
* [jQuery](http://jquery.com/)
* Please refer to our Gemfile for gems used.

## Workflow

#### ERD

![Imgur](http://i.imgur.com/btfHVrX.png)

#### wireframes

Homepage without login

![Imgur](http://i.imgur.com/3m6CXfJ.png)

Homepage after login

![Imgur](http://i.imgur.com/nzlveiT.png)

Booking page (making a Booking)

![Imgur](http://i.imgur.com/uAMjrlD.png)

Booking page (after Booking)

![Imgur](http://i.imgur.com/55r0K14.png)


## Acknowledgments

* [Marine Parade CC's website](https://www.eventbrite.sg/d/marine-parade/events/?crt=regular&sort=best)
* Prima
* Jeremiah
* Kang Sheng
