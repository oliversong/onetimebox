Meteor.publish 'files', ()->
  return Files.find({})
