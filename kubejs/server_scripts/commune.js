ServerEvents.recipes(e => {
  e.recipes.createoreexcavation.vein('{"text": "Uraninite Vein}', 'powah:raw_uraninite')
              .placement(128, 32, 45890385903)
              .id("kubejs:uraninite_vein");
  e.recipes.createoreexcavation.drilling('powah:raw_uraninite', 'kubejs:uraninite_vein', 100)
              .id('kubejs:uraninite1');
})
