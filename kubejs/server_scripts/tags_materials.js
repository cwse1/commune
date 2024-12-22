ServerEvents.tags('item', event => {
  const materials = []
  
  materials.forEach(material => {
    event.add('commune:materials', material)
  })
})
