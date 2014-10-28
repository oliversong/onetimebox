Router.configure
  onBeforeAction: clearErrors
  loadingTemplate: 'loading'
  layoutTemplate: 'layout'

Router.map ()->
  @route('landingPage', {
    path: '/'
  })

  @route('boxPage', {
    path: '/box/:_id',
    waitOn: ()->
      Meteor.subscribe('box', @params._id)
    notFoundTemplate: 'sorryPage'
    data: ()->
      _id = @params._id
      Boxes.findOne({_id: _id})
    onBeforeAction: ()->
      Session.set('currentBoxId', @params._id)
  })

  @route('not_found', {
    path: '*'
  })

clearErrors = ()->
  Errors.clearSeen()
