ServerEvents.tags('item', event => {
  const fauna_products = []
  
  engineerging.forEach(item => {
    event.add('commune:fauna_products', item)
  })
})
