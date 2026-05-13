Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> should: aFullBlockClosure raise: anError withMessageText: message [ 
	self 
	should:  aFullBlockClosure 
	raise: anError
	withExceptionDo: [ :error | self assert: error messageText equals: message ].

]

{ #category : 'tests' }
GameTest >> test001WhenShipPlayTurnWithOneLoadedDiceWith6FacesThenThePositionEqualsTo7 [

| ship dice board game |
ship := Ship new.
dice:= DiceLoaded with: 6.
board := Board with: 10.
game := Game withShips: {ship} dice: {dice} board: board laps: 1.

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
game := Game withShips: ships dice: {dice} board: board laps: 1.

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
game := Game withShips: ships dice: {dice} board: board laps: 1.

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
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.


self assert: game hasFinished.

]

{ #category : 'tests' }
GameTest >> test005WhenShipCompletesOneLapThenGameHasFinished [
    | ship dice board game |
    ship := Ship new.
    dice := DiceLoaded with: 6.
    board := Board with: 6.
    game := Game withShips: {ship} dice: {dice} board: board laps: 1.
    
    game playTurn.
    
    self assert: game hasFinished.

]

{ #category : 'tests' }
GameTest >> test005WhenShipCrossesGoalThenThatShipIsTheWinner [

| dice board game ship1 ship2 ships |
ship1 := Ship new.
ship2 := Ship new.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= DiceLoaded with: 6.
board := Board with: 10.
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.
game playTurn.
game playTurn.


self assert: game winner equals: ship1.

]

{ #category : 'tests' }
GameTest >> test006WhenGameIsFinishedThenPlayTurnRaisesError [

| dice board game ship1 ships |
ship1 := Ship new.

ships:= OrderedCollection new.
ships add: ship1.

dice:= DiceLoaded with: 6.
board := Board with: 10.
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.
game playTurn.
self
should: [game playTurn] 
raise: Error 
withMessageText: 'The game has already finished'.




]

{ #category : 'tests' }
GameTest >> test007WhenGameFinishesCanKnowPositionOfEachShip [

| dice board game ship1 ship2 ships |
ship1 := Ship new.
ship2 := Ship new.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= DiceLoaded with: 6.
board := Board with: 10.
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.
game playTurn.
game playTurn.


self assert: (game positionOf: ship1) equals: 3.
self assert: (game positionOf: ship2) equals: 7 

]

{ #category : 'running' }
GameTest >> test008WhenGameHasNotFinishedThenWinnerRaisesError [
	|dice board game ship ships|
	ship:= Ship new.
	ships:= OrderedCollection new.
	ships add: ship.
	dice:= DiceLoaded with:2.
	board:= Board with: 10.
	game:= Game withShips: ships  dice:{dice}  board: board laps: 1.
	
	self
	should: [game winner ]
	raise: Error
	withMessageText: 'The game has not finished yet'
]

{ #category : 'running' }
GameTest >> test009WhenGameIsCreatedWithNoShipsThenRaiseError [
	
	self
	
	should:[Game withShips: OrderedCollection new dice:{DiceLoaded with: 2}   board:(Board with: 10) ]
	raise: Error
	withMessageText: 'Game must have at least one ship'
]

{ #category : 'running' }
GameTest >> test010WhenGameIsCreatedWithNoDiceThenRaiseError [
	
    self
        should: [ Game withShips: {Ship new} dice: {} board: (Board with: 10) ]
        raise: Error
        withMessageText: 'Game must have at least one dice'
]

{ #category : 'running' }
GameTest >> test011WhenPlayTurnWithTwoDifferentLoadedDiceThenShipAdvancesTheirSum [
    | ship dice1 dice2 board game |
    ship := Ship new.
    dice1 := DiceLoaded with: 3.
    dice2 := DiceLoaded with: 4.
    board := Board with: 20.
    game := Game withShips: {ship} dice: {dice1. dice2} board: board laps: 1.
    
    game playTurn.
    
    self assert: ship position equals: 8.
]

{ #category : 'running' }
GameTest >> test012WhenTwoShipsPlayWithTwoDiceThenBothAdvanceTheirSum [
    | ship1 ship2 dice1 dice2 board game |
    ship1 := Ship new.
    ship2 := Ship new.
    dice1 := DiceLoaded with: 3.
    dice2 := DiceLoaded with: 4.
    board := Board with: 20.
    game := Game withShips: {ship1. ship2} dice: {dice1. dice2} board: board laps: 1.
    
    game playTurn.
    game playTurn.
    
    self assert: ship1 position equals: 8.
    self assert: ship2 position equals: 8.
]

{ #category : 'running' }
GameTest >> test013WhenShipAdvancesBeyondBoardSizeThenLapsEquals1 [
    | ship dice board game |
    ship := Ship new.
    dice := DiceLoaded with: 6.
    board := Board with: 6.
    game := Game withShips: {ship} dice: {dice} board: board laps: 1.
    
    game playTurn.
    
    self assert: ship laps equals: 1.
]

{ #category : 'running' }
GameTest >> test014WhenShipAdvancesBeyondBoardSizeThenPositionWrapsAround [
    | ship dice board game |
    ship := Ship new.
    dice := DiceLoaded with: 6.
    board := Board with: 6.
    game := Game withShips: {ship} dice: {dice} board: board laps: 1.
    
    game playTurn.
    
    self assert: ship position equals: 1.
]
