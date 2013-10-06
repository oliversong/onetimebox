Meteor.publish 'files', (boxId)->
  console.log boxId
  return Files.find({boxId:boxId})
