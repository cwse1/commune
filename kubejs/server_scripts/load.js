ServerEvents.loaded(event => {
  let init = event.server.persistentData;

  if(!init.firstLaunch) {
    init.firstLaunch = true
    event.server.schedule(2 * MINUTE, c => {
      Utils.server.runCommand("/gamerule spawnRadius 0");
      Utils.server.runCommand("/setworldspawn 0 72 0");
    })
  }
  return 1;
})
