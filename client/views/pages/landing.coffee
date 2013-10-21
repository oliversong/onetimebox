Template.landingPage.helpers(
  count: ()->
    fc = FileCount.findOne()
    if fc
      numberWithCommas(fc.count)
    else
      ''
)

Template.landingPage.events(
  'click .btn-large': (e)->
    Meteor.call 'makeBox', {}, (error, id)->
      if error
        Errors.throw(error.reason)

        if error.error is 302
          Router.go('landingPage', error.details)
      Router.go('/box/'+id)
)

numberWithCommas = (x)->
  if x is undefined
    ''
  else
    x.toString().replace /\B(?=(\d{3})+(?!\d))/g, ","
