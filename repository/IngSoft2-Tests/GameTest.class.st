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
ship := Ship named: 'Ship1'.
dice:= LoadedDie with: 6.
board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new).
game := Game withShips: {ship} dice: {dice} board: board laps: 1.

game playTurn.

self assert: ship position equals: 7.

]

{ #category : 'tests' }
GameTest >> test002WhenTwoShipsPlayOneTurnWithOneLoadedDiceThenBothAreAtPosition7 [

| dice board game ship1 ship2 ships |
ship1 := Ship named: 'Ship1'.
ship2 := Ship named: 'Ship2'.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= LoadedDie with: 6.
board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.
game playTurn.

self assert: ship1 position equals: 7.
self assert: ship2 position equals: 7.

]

{ #category : 'tests' }
GameTest >> test003WhenOnlyShipOnePlaysTurnThenShip2RemainsAtPosition1 [ 

| dice board game ship1 ship2 ships |
ship1 := Ship named: 'Ship1'.
ship2 := Ship named: 'Ship2'.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= LoadedDie with: 6.
board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.


self assert: ship2 position equals: 1.

]

{ #category : 'tests' }
GameTest >> test004WhenShipCrossesGoalThenGameHasFinished [

	| dice board game ship1 ship2 ships |
	ship1 := Ship named: 'Ship1'.
	ship2 := Ship named: 'Ship2'.
	ships := OrderedCollection new.
	ships add: ship1.
	ships add: ship2.
	dice := LoadedDie with: 6.
	board := Board
		         with: 6
		         parsecs: 100
		         effects: (Array new: 6 withAll: NoEffect new).
	game := Game
		        withShips: ships
		        dice: { dice }
		        board: board
		        laps: 1.

	game playTurn.


	self assert: game hasFinished
]

{ #category : 'tests' }
GameTest >> test005WhenShipCrossesGoalThenThatShipIsTheWinner [

| dice board game ship1 ship2 ships |
ship1 := Ship named: 'Ship1'.
ship2 := Ship named: 'Ship2'.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= LoadedDie with: 6.
board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new).
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.
game playTurn.
game playTurn.


self assert: game winner equals: ship1.

]

{ #category : 'tests' }
GameTest >> test006WhenShipCompletesOneLapThenGameHasFinished [

	| ship dice board game |
	ship := Ship named: 'Ship1'.

	dice := LoadedDie with: 6.
	board := Board
		         with: 6
		         parsecs: 100
		         effects: (Array new: 6 withAll: NoEffect new).
	game := Game
		        withShips: { ship }
		        dice: { dice }
		        board: board
		        laps: 1.

	game playTurn.

	self assert: game hasFinished
]

{ #category : 'tests' }
GameTest >> test007WhenGameIsFinishedThenPlayTurnRaisesError [

| dice board game ship1 ships |
ship1 := Ship named: 'Ship1'.

ships:= OrderedCollection new.
ships add: ship1.

dice:= LoadedDie with: 6.
board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.
game playTurn.
self
should: [game playTurn] 
raise: Error 
withMessageText: 'The game has already finished'.




]

{ #category : 'tests' }
GameTest >> test008WhenGameFinishesCanKnowPositionOfEachShip [

| dice board game ship1 ship2 ships |
ship1 := Ship named: 'Ship1'.
ship2 := Ship named: 'Ship2'.
ships:= OrderedCollection new.
ships add: ship1.
ships add: ship2.
dice:= LoadedDie with: 6.
board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new).
game := Game withShips: ships dice: {dice} board: board laps: 1.

game playTurn.
game playTurn.
game playTurn.


self assert: (game positionOf: ship1) equals: 3.
self assert: (game positionOf: ship2) equals: 7 

]

{ #category : 'running' }
GameTest >> test009WhenGameHasNotFinishedThenWinnerRaisesError [
	|dice board game ship ships|
	ship := Ship named: 'Ship1'.

	ships:= OrderedCollection new.
	ships add: ship.
	dice:= LoadedDie with:2.
	board:= Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
	game:= Game withShips: ships  dice:{dice}  board: board laps: 1.
	
	self
	should: [game winner ]
	raise: Error
	withMessageText: 'The game has not finished yet'
]

{ #category : 'running' }
GameTest >> test010WhenGameIsCreatedWithNoShipsThenRaiseError [
	
	self
	
	should:[Game withShips: OrderedCollection new dice:{LoadedDie with: 2}   board:(Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new)) ]
	raise: Error
	withMessageText: 'Game must have at least one ship'
]

{ #category : 'running' }
GameTest >> test011WhenGameIsCreatedWithNoDiceThenRaiseError [
	
    self
        should: [ Game withShips: {Ship new} dice: {} board: (Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) ) ]
        raise: Error
        withMessageText: 'Game must have at least one dice'
]

{ #category : 'running' }
GameTest >> test012WhenPlayTurnWithTwoDifferentLoadedDiceThenShipAdvancesTheirSum [

	| ship dice1 dice2 board game |
	ship := Ship named: 'Ship1'.

	dice1 := LoadedDie with: 3.
	dice2 := LoadedDie with: 4.
	board := Board
		         with: 20
		         parsecs: 100
		         effects: (Array new: 20 withAll: NoEffect new).
	game := Game
		        withShips: { ship }
		        dice: {
				        dice1.
				        dice2 }
		        board: board
		        laps: 1.

	game playTurn.

	self assert: ship position equals: 8
]

{ #category : 'running' }
GameTest >> test013WhenShipAdvancesBeyondBoardSizeThenLapsEquals1 [

	| ship dice board game |
	ship := Ship named: 'Ship1'.
	dice := LoadedDie with: 6.
	board := Board
		         with: 6
		         parsecs: 100
		         effects: (Array new: 6 withAll: NoEffect new).
	game := Game
		        withShips: { ship }
		        dice: { dice }
		        board: board
		        laps: 1.

	game playTurn.

	self assert: ship laps equals: 1
]

{ #category : 'running' }
GameTest >> test014WhenTwoShipsPlayWithTwoDiceThenBothAdvanceTheirSum [

	| ship1 ship2 dice1 dice2 board game |
	ship1 := Ship named: 'Ship1'.
	ship2 := Ship named: 'Ship2'.
	dice1 := LoadedDie with: 3.
	dice2 := LoadedDie with: 4.
	board := Board
		         with: 20
		         parsecs: 100
		         effects: (Array new: 20 withAll: NoEffect new).
	game := Game
		        withShips: {
				        ship1.
				        ship2 }
		        dice: {
				        dice1.
				        dice2 }
		        board: board
		        laps: 1.

	game playTurn.
	game playTurn.

	self assert: ship1 position equals: 8.
	self assert: ship2 position equals: 8
]

{ #category : 'running' }
GameTest >> test015WhenShipAdvancesBeyondBoardSizeThenPositionWrapsAround [

	| ship dice board game |
	ship := Ship named: 'Ship1'.

	dice := LoadedDie with: 6.
	board := Board
		         with: 6
		         parsecs: 100
		         effects: (Array new: 6 withAll: NoEffect new).
	game := Game
		        withShips: { ship }
		        dice: { dice }
		        board: board
		        laps: 1.

	game playTurn.

	self assert: ship position equals: 1
]

{ #category : 'running' }
GameTest >> test016WhenShipCompletesOneLapThenGameKnowsLapOfShip [

	| ship dice board game |
	ship := Ship named: 'Ship1'.
	dice := LoadedDie with: 6.
	board := Board
		         with: 6
		         parsecs: 100
		         effects: (Array new: 6 withAll: NoEffect new).
	game := Game
		        withShips: { ship }
		        dice: { dice }
		        board: board
		        laps: 2.

	game playTurn.

	self assert: (game lapsOf: ship) equals: 1
]

{ #category : 'running' }
GameTest >> test017WhenShip1PlaysTurnThenShip2HasNotMoved [
    | ship1 ship2 dice board game |
    ship1 := Ship named: 'Ship1'.
ship2 := Ship named: 'Ship2'.
    dice := LoadedDie with: 6.
    board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship1. ship2} dice: {dice} board: board laps: 2.
    
    game playTurn.
    
    self assert: ship1 position equals: 7.
    self assert: ship2 position equals: 1.
]

{ #category : 'running' }
GameTest >> test018WhenShip1HasMoreLapsThenShip1IsFirst [

	| ship1 ship2 dice board game |
	ship1 := Ship named: 'Ship1'.
	ship2 := Ship named: 'Ship2'.
	dice := LoadedDie with: 6.
	board := LoadedBoard
		         with: 10
		         parsecs: 100
		         effects: (Array new: 10 withAll: NoEffect new).
	game := Game
		        withShips: {
				        ship1.
				        ship2 }
		        dice: { dice }
		        board: board
		        laps: 3.

	game playTurn. 
	game playTurn. 
	game playTurn. 

	self assert: (game rankOf: ship1) equals: 1.
	self assert: (game rankOf: ship2) equals: 2
]

{ #category : 'running' }
GameTest >> test019WhenShipLandsOnSpeedUpSquareThenPositionAdvances4 [
    | ship dice board game |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: { NoEffect new. SpeedUp new. NoEffect new. NoEffect new. NoEffect new. NoEffect new. NoEffect new. NoEffect new. NoEffect new. NoEffect new }.
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    
    game playTurn.
    
    self assert: ship position equals: 6.
]

{ #category : 'running' }
GameTest >> test020WhenGameIsCreatedWithoutLapsThenDefaultsToOneLap [
    | ship dice board game |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 6.
    board := Board with: 6 parsecs: 100 effects: (Array new: 6 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board.
    
    game playTurn.
    
    self assert: game hasFinished.
]

{ #category : 'running' }
GameTest >> test021WhenShipLandsOnSpeedUpAndCrossesGoalThenLapIsAdded [
    | ship dice board game |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: { NoEffect new. NoEffect new. NoEffect new. NoEffect new. NoEffect new. NoEffect new. NoEffect new. SpeedUp new. NoEffect new. NoEffect new }.
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    
    ship moveTo: 7.
    game playTurn.
    
    self assert: ship laps equals: 1.
]

{ #category : 'running' }
GameTest >> test022WhenShipsHaveSameLapsButDifferentPositionThenHigherPositionIsFirst [

	| ship1 ship2 dice board game |
	ship1 := Ship named: 'Ship1'.
	ship2 := Ship named: 'Ship2'.
	dice := LoadedDie with: 3.
	board := LoadedBoard
		         with: 10
		         parsecs: 100
		         effects: (Array new: 10 withAll: NoEffect new).
	game := Game
		        withShips: {
				        ship1.
				        ship2 }
		        dice: { dice }
		        board: board
		        laps: 3.

	game playTurn. 
	game playTurn. 
	game playTurn. 

	self assert: (game rankOf: ship1) equals: 1.
	self assert: (game rankOf: ship2) equals: 2
]

{ #category : 'as yet unclassified' }
GameTest >> test023WhenShipLandsOnSpeedUpThatLeadsToWormHoleThenWormHoleDoesNotTrigger [
    | ship dice board game effects |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 2.
    effects := Array new: 10 withAll: NoEffect new.
    effects at: 3 put: SpeedUp new.
    effects at: 7 put: WormHole new.
    board := Board with: 10 parsecs: 100 effects: effects.
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    
    game playTurn.
    
    self assert: ship position equals: 7.
]

{ #category : 'running' }
GameTest >> test024WhenShipLandsOnWormHoleThatLeadsToSpeedUpThenSpeedUpDoesNotTrigger [
    | ship dice board game effects |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 7.
    effects := Array new: 10 withAll: NoEffect new.
    effects at: 4 put: SpeedUp new.
    effects at: 8 put: WormHole new.
    board := Board with: 10 parsecs: 100 effects: effects.
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    
    game playTurn.
    
    self assert: ship position equals: 4.
]

{ #category : 'running' }
GameTest >> test025WhenShipLandsOnAtomicBombAfterCompletingALapThenLapIsKept [
    | ship dice board game effects |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 4.
    effects := Array new: 10 withAll: NoEffect new.
    effects at: 5 put: AtomicBomb new.
    board := Board with: 10 parsecs: 100 effects: effects.
    game := Game withShips: {ship} dice: {dice} board: board laps: 3.
    
    ship addLap.
    game playTurn.
    
    self assert: ship position equals: 1.
    self assert: ship laps equals: 1.
]
