Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'dice',
		'board',
		'turnIndex',
		'laps',
		'lapsToWin'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withShips: someShips dice: someDice board: aBoard [
	someShips isEmpty ifTrue: [ Error signal: 'Game must have at least one ship'].
	someDice isEmpty ifTrue: [ Error signal: 'Game must have at least one dice'].
	^ self new initializeWithShips: someShips dice: someDice board: aBoard 
]

{ #category : 'as yet unclassified' }
Game class >> withShips: someShips dice: someDice board: aBoard laps: aLaps [
	someShips isEmpty ifTrue: [ Error signal: 'Game must have at least one ship'].
	someDice isEmpty ifTrue: [ Error signal: 'Game must have at least one dice'].
	^ self new initializeWithShips: someShips dice: someDice board: aBoard laps: aLaps
]

{ #category : 'testing' }
Game >> hasFinished [
    
    ^ ships anySatisfy: [ :ship | board hasShipReachedGoal: ship withLaps: lapsToWin ].


]

{ #category : 'initialization' }
Game >> initializeWithShips: someShips dice: someDice board: aBoard [
    ships := someShips.
    dice := someDice.
    board := aBoard.
    turnIndex := 1.
	
]

{ #category : 'initialization' }
Game >> initializeWithShips: someShips dice: someDice board: aBoard laps: aLaps [
    ships := someShips.
    dice := someDice.
    board := aBoard.
	 lapsToWin := aLaps.
    turnIndex := 1.
	
]

{ #category : 'as yet unclassified' }
Game >> lapsOf: aShip [ 
	^ aShip laps
]

{ #category : 'as yet unclassified' }
Game >> playTurn [

	| currentShip totalRoll newPosition |
	self hasFinished ifTrue: [Error signal: 'The game has already finished'].
	currentShip := ships at: turnIndex.
	totalRoll := self rollAllTheDice.
	newPosition := currentShip position + totalRoll.
	(board hasCompletedLap: newPosition) ifTrue: [ currentShip addLap ].
	currentShip moveTo: (board wrapPosition: newPosition).
	turnIndex := (turnIndex rem: ships size) + 1
]

{ #category : 'as yet unclassified' }
Game >> positionOf: aShip [

	^ aShip position
]

{ #category : 'as yet unclassified' }
Game >> rollAllTheDice [

	^ dice inject: 0 into: [ :sum  :aDie | sum  + aDie roll ]
]

{ #category : 'as yet unclassified' }
Game >> winner [
	^ ships
	detect: [:ship | board hasShipReachedGoal: ship withLaps: lapsToWin ]
	ifNone: [Error signal: 'The game has not finished yet']
]
