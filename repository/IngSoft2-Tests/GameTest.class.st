Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test001WhenShipPlayTurnWithOneLoadedDiceWith6FacesThenThePositionEqualsTo7 [

| ship dice board game |
ship := Ship new.
dice:= DiceLoaded with: 6.
board := Board with: 10.
game := Game withShips: {ship} dice: {dice} board: board.

game playTurn.

self assert: ship position equals: 7.

]

{ #category : 'tests' }
GameTest >> test002WhenTwoShipsPlayOneTurnWithOneLoadedDiceThenBothAreAtPosition7 [

| dice board game ship1 ship2 ships |
ship1 := Ship new.
ship2 := Ship new.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= DiceLoaded with: 6.
board := Board with: 10.
game := Game withShips: ships dice: {dice} board: board.

game playTurn.
game playTurn.

self assert: ship1 position equals: 7.
self assert: ship2 position equals: 7.

]

{ #category : 'tests' }
GameTest >> test003WhenOnlyShipOnePlaysTurnThenShip2RemainsAtPosition1 [ 

| dice board game ship1 ship2 ships |
ship1 := Ship new.
ship2 := Ship new.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= DiceLoaded with: 6.
board := Board with: 10.
game := Game withShips: ships dice: {dice} board: board.

game playTurn.


self assert: ship2 position equals: 1.

]

{ #category : 'tests' }
GameTest >> test004WhenShipCrossesGoalThenGameHasFinished [ 

| dice board game ship1 ship2 ships |
ship1 := Ship new.
ship2 := Ship new.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= DiceLoaded with: 6.
board := Board with: 6.
game := Game withShips: ships dice: {dice} board: board.

game playTurn.


self assert: game hasFinished.

]
