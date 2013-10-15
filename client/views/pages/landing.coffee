Template.landingPage.helpers(
  count: ()->
    fc = FileCount.findOne()
    if fc
      fc.count
    else
      undefined
)

Template.landingPage.events(
  'click .btn-large': (e)->
    Meteor.call 'makeBox', {}, (error, id)->
      if error
        Errors.throw(error.reason)

        if error.error is 302
          Meteor.Router.to('landingPage', error.details)
      Meteor.Router.to('/box/'+id)
)
