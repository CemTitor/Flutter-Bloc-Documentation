# bloc_docs

A new Flutter project.

## Getting Started

Project for learning BloC pattern. In the "main.dart" comment other that you want to use.

BloC Pattern Summary:

- BloC is a pattern that helps to separate business logic from UI.

--------------------------------------
   Events ------> BLOC ------> State
--------------------------------------
Events: User actions, like button click, text input, etc. 
Events goes into the pipe.

BLOC: Business Logic Component. It is a pipe that receives events and outputs states. Determines what to do depending on incoming event.

State: The state is the output of the BLOC. It is the data that will be displayed on the screen.

So we need 3 classes for this pattern

When you press search button, you add an event to the BLOC. The BLOC will process the event and output a state. Then UI will receive the state and display it.

For every interaction that the user can do with my event, you want to have a response to that interaction. So every interaction should have a BLOC.
