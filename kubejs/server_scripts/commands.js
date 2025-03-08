ServerEvents.commandRegistry(event => {
  const {commands: Commands, arguments: Arguments} = event;
  event.register(
    Commands.literal("boot")
      .requires(src => src.hasPermission(4))
      .executes(c => {
        let i = 0;
        Utils.server.runCommand("/player TheLibrary spawn");
        Utils.server.runCommand("/tp TheLibrary 0 72 0");
        return i;
      })
  );
  event.register(
    Commands.literal("size")
      .requires(src => src.hasPermission(2))
      .executes(c => size(c.source.player))
  ); 
  event.register(
    Commands.literal("grow")
      .requires(src => src.hasPermission(2))
      .executes(c => size(c.source.player))
      .then(Command.argument("scale", Arguments.STRING.create(event))
        .then(Command.argument("target", Arguments.PLAYER.create(event)))
      )
  )
  let size = () => {
    Utils.server.runCommand("scale set pehkui:base 1 @p");
  } 
})
