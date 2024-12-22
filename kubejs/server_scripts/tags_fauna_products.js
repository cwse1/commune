ServerEvents.tags('item', event => {
  const fauna_products = []
  
  fauna_products.forEach(item => {
    event.add('commune:fauna_products', item)
  })
})
