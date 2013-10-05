Meteor.Router.add
  '/': (->
    return 'landingPage'
  )
  '/boxes/:_id':
    to: 'boxPage'
    and: (id)->
      Session.set 'currentBoxId', id

Meteor.Router.filters
  'clearErrors': (page)->
    Meteor.Errors.clear()
    return page

Meteor.Router.filter('clearErrors')
