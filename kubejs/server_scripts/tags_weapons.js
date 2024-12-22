ServerEvents.tags('item', event => {
  const weapons = []
  
  weapons.forEach(weapon => {
    event.add('commune:weapons', weapon)
  })
})
