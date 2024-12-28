ServerEvents.tags('item', event => {
  const engineering = []
  
  engineering.forEach(item => {
    event.add('commune:engineering', item)
  })
})
