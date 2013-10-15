if Meteor.isServer
  Meteor.startup( ->
    current = Files.find().count()
    fc = FileCount.findOne()
    if fc
      FileCount.update({"_id":fc._id}, {$set: {count: current}})
    else
      FileCount.insert({count: current})
  )
