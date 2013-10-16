# One Time Box

It is etherpad for Dropbox.
______

## Bugs
* File drop sometimes doesn't work on initial pageload
* Router can't find own box because not subscribed...(todo when expire boxes)
* Xorigin bug for certain files- is this a filepicker issue?

## Todo
* Alternate upload button w/ full account options
* Start adding timestamps to new boxes
* After 2 days, delete all boxes that don't have a timestamp
* Integrate Meteor Cron to Delete boxes that are 1 or 2 days old
* Open source!!
* Redesign boxes on front page to not be canned
* Make press logos scale responsively
* Download all
* Copy to clipboard button (automatically?)

## Possible
* Let user limit downloads of certain files
* Read only option? (only sender can delete)

## Will not do
* BigVideo dependencies are fucked in Meteor.js
* s3 assets
* Live number of users connected to box
* Google analytics
