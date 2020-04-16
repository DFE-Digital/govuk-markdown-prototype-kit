# Govspeak Prototype

This is a minimal prototype kit aimed at testing and researching content that's
intended to be published via the [Whitehall Publisher](https://www.gov.uk/guidance/how-to-publish-on-gov-uk).

It uses [Nanoc](https://nanoc.ws/), a static site generator written in Ruby.


## Getting going

Clone this app, `cd` to the repo's root directory and run:

``` bash
$ npm install
$ bundle install
```

If that succeeded, we can start the app and have it live reload our changes:

```bash
$ bundle exec nanoc live
```

Navigate to `https://localhost:3000` and if you see this, it worked!

![home page](docs/sample.png)
