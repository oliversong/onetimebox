Template.landingPage.helpers(

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
