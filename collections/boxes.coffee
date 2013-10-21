@Boxes = new Meteor.Collection('boxes')

Meteor.methods(
  makeBox: ()->
    box =
      # current unix timestamp (seconds)
      dateCreated : Math.round(new Date().getTime() / 1000)
    boxId = Boxes.insert(box)
    boxId
)
