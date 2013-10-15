Meteor.startup( ->
  current = Files.find().count()
  fc = FileCount.findOne()
  unless fc
    # FileCount.update({"_id":fc._id}, {$set: {count: current}})
    FileCount.insert({count: current})
)
