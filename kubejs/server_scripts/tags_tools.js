ServerEvents.tags('item', event => {
  const tools = []
  
  tools.forEach(tool => {
    event.add('commune:tools', tool)
  })
})
