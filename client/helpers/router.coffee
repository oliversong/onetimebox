Meteor.Router.add
  '/': {to: 'landingPage', as: 'landing'}

  '/box/:_id':
    to: (id)->
      if Boxes.find({_id:id}).fetch().length is 0
        'sorryPage'
      else
        Session.set 'currentBoxId', id
        'boxPage'

  '*': 'not_found'

Meteor.Router.filters
  'clearErrors': (page)->
    Errors.clearSeen()
    return page

Meteor.Router.filter('clearErrors')
