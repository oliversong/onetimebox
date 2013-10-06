Meteor.publish 'files', (boxId)->
  return Files.find({boxId:boxId})
