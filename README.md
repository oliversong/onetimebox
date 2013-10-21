# Onetimebox
Easily create and share single-use, live web folders.

______

## Contributing

Onetimebox is an open source project. If you'd like to contribute, just submit a PR! Onetimebox can always be improved. It doesn't matter how experienced you are with Meteor, or whether you're familiar with real-time applications. There are plenty of ways to be helpful!

### Dev workflow

To contribute, fork the main repo and make your own branch. When you're done developing, send in a PR and we'll take a look.

## Want to roll your own? It's super easy!

First, install Meteor (http://www.meteor.com/):
```
$ curl https://install.meteor.com | sh
```

Then install Meteorite:
```
$ npm install -g meteorite
```

Clone the repo:
```
git clone git@github.com:oliversong/onetimebox.git
cd onetimebox
```

Now head over to https://www.inkfilepicker.com/ and register for an account. They'll provide you with an API key. You're going to put that key in `/lib/key.coffee`, like this:

```
touch /lib/key.coffee
```

Paste:

```
# filepicker API key
Meteor.filepickerKey = 'MyFilepickerAPIKey'
```

You can also include Google Analytics. Go ahead and paste your Google Analytics code in `/client/views/includes/analytics.html`:

```
touch /client/views/includes/analytics.html
```

Paste:

```
<template name="analytics">
  <head>
    <script>
      My Google Analytics Code
    </script>
  </head>
</template>
```

Now do some development! Make whatever changes you'd like, and when you're all set, bundle and deploy. You can deploy to meteor servers, or EC2, heroku, or any of the normal alternatives. Meteor servers are the easiest, of course:

```
meteor deploy [youronetimeboxname].meteor.com
```
