ServerEvents.recipes(event => {
  let removals = 
    [
      "promenade:sakura_boat",
      "promenade:maple_boat",
      "promenade:palm_boat",
      "terrestria:cypress_boat",
      "terrestria:hemlock_boat",
      "terrestria:japanese_maple_boat",
      "terrestria:rainbow_eucalyptus_boat",
      "terrestria:redwood_boat",
      "terrestria:rubber_boat",
      "terrestria:sakura_boat",
      "terrestria:willow_boat",
      "terrestria:yucca_palm_boat",
      "traverse:fir_boat",
      "applewood:apple_boat",
      "bloomingnature:larch_boat",
      "bloomingnature:baobab_boat",
      "bloomingnature:aspen_boat",
      "bloomingnature:swamp_oak_boat",
      "bloomingnature:swamp_cypress_boat",
      "bloomingnature:fan_palm_boat",
      "bloomingnature:fir_boat",
      "bloomingnature:ebony_boat",
      "bloomingnature:chestnut_boat",
      "bloomingnature:cactus_boat",
      "beachparty:palm_boat",
      "beachparty:floaty",
      "vinery:dark_cherry_boat",
      "meadow:pine_boat"
    ];
  for(var r of removals) {
    event.remove({"output": r});
    event.remove({"input": r});
  };
})
