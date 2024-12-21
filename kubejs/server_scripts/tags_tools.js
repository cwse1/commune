ServerEvents.tags('item', event => {
  const tools = []
  
  blocks.forEach(tool => {
    event.add('commune:tools', tool)
  })
})
