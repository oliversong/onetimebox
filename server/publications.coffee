Meteor.publish 'files', ()->
  return Files.find(
    boxId: @boxId
  )
