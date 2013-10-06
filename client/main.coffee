Meteor.subscribe 'notifications'

Deps.autorun ()->
  console.log 'There are ' + Boxes.find().count() + ' boxes'
