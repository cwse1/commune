ServerEvents.commandRegistry(event => {
  const {commands: Commands, arguments: Arguments} = event;
  event.register(
    Commands.literal("boot")
      .requires(src => src.hasPermission(2))
      .executes(c => {
        let i = 0;
        Utils.server.runCommand("/player TheLibrary spawn");
        i++;
        return i;
      })
  )
})
