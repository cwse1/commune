ServerEvents.recipes(event => {
  event.recipes.createoreexcavation.vein('{"text": "Raw Uraninite"}', 'powah:uraninite_raw')
              .placement(128, 32, 4589033)
              .id("commune:uraninite_vein");
  event.recipes.createoreexcavation.drilling('powah:uraninite_raw', 'commune:uraninite_vein', 100)
              .id('commune:uraninite1');
})
