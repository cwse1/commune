ServerEvents.commandRegistry(event => {
  const {commands: Commands, arguments: Arguments} = event;
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
