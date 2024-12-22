ServerEvents.tags('item', event => {
  const flora = []
  
  flora.forEach(flora => {
    event.add('commune:flora', flora)
  })
})
