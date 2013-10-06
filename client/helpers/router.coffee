Meteor.Router.add
  '/': {to: 'landingPage', as: 'landing'}
  '/box/:_id':
    to: 'boxPage'
    and: (id)->
      Session.set 'currentBoxId', id

Meteor.Router.filters
  'clearErrors': (page)->
    Errors.clearSeen()
    return page

Meteor.Router.filter('clearErrors')
