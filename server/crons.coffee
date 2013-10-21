MyCron = new Cron()

MyCron.addJob(1, ()->
  console.log "Garbage collecting old files and boxes..."
  # find all expired files and boxes and delete them, also remove files from filepicker
  # current timestamp
  ts = Math.round(new Date().getTime() / 1000)
  expiredFiles = Files.find({dateCreated: {$lte: ts - 604800}}).fetch()
  expiredBoxes = Boxes.find({dateCreated: {$lte: ts - 604800}}).fetch()
  for file in expiredFiles
    HTTP.del(file.url+"?key="+Meteor.filepickerKey)
    console.log "File " + file.name + " removed from filepicker."

  Boxes.remove({dateCreated: {$lte: ts - 604800}})
  console.log("Removed " + expiredBoxes.length + " boxes")
  Files.remove({dateCreated: {$lte: ts - 604800}})
  console.log("Removed " + expiredFiles.length + " files")
)
