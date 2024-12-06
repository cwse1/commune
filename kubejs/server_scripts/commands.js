ServerEvents.commandRegistry(event => {
  const {commands: Commands, arguments: Arguments} = event;
  event.register(
    Commands.literal("boot")
      .requires(src => src.hasPermission(2))
      .executes(c => {
        let i = 0;
        Utils.server.runCommand("/player TheLibrary spawn");
        Utils.server.runCommand("/tp TheLibrary 0 72 0");
        return i;
      })
  );
  event.register(
    Commands.literal("shrink")
      .requires(src => src.hasPermission(2))
      .executes(c => {
        let i = 0;
        Utils.server.runCommand("scale set pehkui:base 0.25 @p");
        return i;
      })
  ); 
  event.register(
    Commands.literal("grow")
      .requires(src => src.hasPermission(2))
      .executes(c => {
        let i = 0;
        Utils.server.runCommand("scale set pehkui:base 1 @p");
        return i;
      })
  )
})
