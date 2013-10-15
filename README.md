# One Time Box

It is etherpad for Dropbox.
______

## Bugs
* File drop sometimes doesn't work on initial pageload
* Router can't find own box because not subscribed...(todo when expire boxes)
* Xorigin bug for certain files- is this a filepicker issue?

## Todo
* Start adding timestamps to new boxes
* After 2 days, delete all boxes that don't have a timestamp
* Integrate Meteor Cron to Delete boxes that are 1 or 2 days old
* Open source!!

## Will not do
* BigVideo dependencies are fucked in Meteor.js
* s3 assets
* Alternate upload button 1 hr
* Live number of users connected to box
* Google analytics
