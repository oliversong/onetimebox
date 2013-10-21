# Onetimebox
Easily create and share single-use, live web folders.

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
$ git clone git@github.com:oliversong/onetimebox.git
$ cd onetimebox
```

Now head over to https://www.inkfilepicker.com/ and register for an account. They'll provide you with an API key. You're going to put that key in `/lib/key.coffee`, like this:

Paste:

```
# filepicker API key
Meteor.filepickerKey = 'MyFilepickerAPIKey'
```

You can also include Google Analytics. Go ahead and paste your Google Analytics code in `/client/analytics.coffee`:

Paste:

```
Template.layout.rendered = ()->
  Google Analytics Coffeescript
```

Note: You currently need to convert your Google Analytics JS to Coffeescript and paste it in here.

Now do some development! Make whatever changes you'd like, and when you're all set, bundle and deploy. You can deploy to meteor servers, or EC2, heroku, or any of the normal alternatives. Meteor servers are the easiest, of course:

```
meteor deploy [youronetimeboxname].meteor.com
```

## Contributing

Onetimebox is an open source project. If you'd like to contribute, just submit a PR! Onetimebox can always be improved. It doesn't matter how experienced you are with Meteor, or whether you're familiar with real-time applications. There are plenty of ways to be helpful.

### Dev workflow

To contribute, fork the main repo and make your own branch. When you're done developing, send in a PR and we'll take a look.

### License

The MIT License (MIT)

Copyright (c) 2013 Oliver Song

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
