Meteor.publish 'files', (boxId)->
  return Files.find({boxId:boxId})

Meteor.publish 'box', (boxId)->
  return Boxes.find({_id: boxId})

# server: publish the current size of a collection
Meteor.publish 'filecount', () ->
  return FileCount.find()
