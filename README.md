# Govspeak Prototype

This is a minimal prototype kit aimed at testing and researching content that's
intended to be published via the [Whitehall Publisher](https://www.gov.uk/guidance/how-to-publish-on-gov-uk).

It uses [Nanoc](https://nanoc.ws/), a static site generator written in Ruby.

## What is govspeak?

[Govspeak](https://github.com/alphagov/govspeak) is a simplified 'markup'
language based on [Markdown](https://commonmark.org/). It's designed to be as
[easy-to-read and easy-to-write](https://govspeak-preview.herokuapp.com/guide)
as possible.

## Requirements
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/#homebrew)
- [NPM](https://www.npmjs.com/get-npm)

## Getting started

Clone this app, `cd` to the repo's root directory and run:

``` bash
$ npm install
$ bundle install
```

If that succeeded, we can start the app and have it live reload our changes:

```bash
$ bundle exec nanoc live
```

Navigate to `http://localhost:3000` and if you see this, it worked!

![home page](docs/sample.png)

## Publishing content

### GOV.UK PaaS

Providing you have a  [GOV.UK PaaS](https://www.cloud.service.gov.uk/) and have
been allocated a space, this prototype is ready to publish. We just need to
give the app a name (see `manifest.yml`), log in (`cf login`) and push (`cf
push`).

If you want your prototype to be protected by [Basic authentication](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication)
you need to add a `Staticfile.auth`. CloudFoundry's documentation covers the process in
[plenty of detail](https://docs.cloudfoundry.org/buildpacks/staticfile/index.html#basic-authentication).

### Netlify

Netlify is the easiest way to publish your content on the web and its integration
with GitHub is preconfigured - all you need to do is sign up for Netlify, [connect your
GitHub account](https://docs.netlify.com/configure-builds/repo-permissions-linking/),
click the ['New site from Git'](https://explorers.netlify.com/learn/split-testing-with-netlify/creating-a-new-netlify-site-with-a-git-repo) button, pick your repository and configure these settings:

* **Build command:** `bundle exec nanoc`
* **Publish directory:** `output`

After a minute or two your site will be live! The URL will be displayed
at the top of the page in the Netlify admin panel and you can change
the randomly-generated identifier to something a bit more user-friendly
by going into the 'Site details' settings and clicking 'Change site name'.

## Adding content

To add a new page create a `.md` file in the `content` directory,
`content/example.md` for example. The page will now be visible at
`http://localhost:3000/example`.

For consistency, keep your filenames lower case, avoid non-alphanumeric characters and use
dashes instead of spaces.

### Frontmatter

Frontmatter is a block of YAML at the top of a file that contains metadata. By
default, this app only makes use of the title, but any structured data can
added.

```
---
title: "My amazing page"
---
```

View the included index file `content/index.md` for an example of using
metadata in a govspeak template.

### Nesting pages

A hierarchy of content can be created using directories. Each directory should have
a corresponding index, so the `hello/` directory should be placed alongside `hello.md`.

| File                                | Path                                           |
| ----                                | ----                                           |
| `content/hello.md`                  | `http://localhost:3000/hello`                  |
| `content/hello/world.md`            | `http://localhost:3000/hello/world`            |
| `content/hello/nice-to-meet-you.md` | `http://localhost:3000/hello/nice-to-meet-you` |

Routing and breadcrumbs are automatically handled.

### Level one headings (or lack thereof)

Govspeak [does not support level one
headings](https://govspeak-preview.herokuapp.com/guide#Headings) by choice. The
document's title will be displayed in a `<h1>` tag at the top of the page, all
subsequent headings should be `<h2>`-`<h6>`.

The default styling for additional `<h1>` tags is intentionally ugly to
discourage their use.

## Contributing

Contributions are always welcome. If you're able to, raising a PR is the
preferred method. If we've missed something or you have a suggestion for
a new feature suggest it in a GitHub issue.

## Support

If something isn't working or doesn't make sense you can ask a question via a
GitHub issue. For more general framework support see [Nanoc's official documentation](https://nanoc.ws/about/).
