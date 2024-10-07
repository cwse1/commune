ServerEvents.loaded(event => {
  event.server.schedule(5 * MINUTE, c => {
    Utils.server.runCommand("/gamerule spawnRadius 0");
    Utils.server.runCommand("/setworldspawn 0 72 0");
  })
  return 1;
})
