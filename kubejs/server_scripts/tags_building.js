ServerEvents.tags('item', event => {
  const blocks = []
  
  blocks.forEach(block => {
    event.add('commune:building', block)
  })
})
