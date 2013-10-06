Template.file.helpers(
  size: ()->
    humanFileSize(@size, false)
)

Template.file.events(
  'click .delete': (e)->
    e.preventDefault()
    if confirm("Delete this file?")
      Files.remove(@_id, Session.get('currentBoxId'))
)

humanFileSize = (bytes, si) ->
  thresh = (if si then 1000 else 1024)
  return bytes + " B"  if bytes < thresh
  units = (if si then ["kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"] else ["KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"])
  u = -1
  loop
    bytes /= thresh
    ++u
    break unless bytes >= thresh
  bytes.toFixed(1) + " " + units[u]
