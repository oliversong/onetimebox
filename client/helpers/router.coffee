Meteor.Router.add
  '/': {to: 'landingPage', as: 'landing'}

  '/box/:_id':
    to: (id)->
      box = Boxes.findOne id
      if box
        # if the box exists, then redirect to it
        Session.set 'currentBoxId', id
        'boxPage'
      else
        # if not, then redirect to the sorry page
        'sorryPage'


  '*': 'not_found'

Meteor.Router.filters
  'clearErrors': (page)->
    Errors.clearSeen()
    return page

Meteor.Router.filter('clearErrors')
