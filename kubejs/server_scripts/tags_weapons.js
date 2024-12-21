ServerEvents.tags('item', event => {
  const weapons = []
  
  blocks.forEach(weapon => {
    event.add('commune:weapons', weapon)
  })
})
