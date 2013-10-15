Meteor.Router.add
  '/': {to: 'landingPage', as: 'landing'}

  '/box/:_id':
    to: (id)->
      Session.set 'currentBoxId', id
      'boxPage'

  '*': 'not_found'

Meteor.Router.filters
  'clearErrors': (page)->
    Errors.clearSeen()
    return page

Meteor.Router.filter('clearErrors')
