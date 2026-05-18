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

{ #category : 'as yet unclassified' }
Game >> board [
    ^ board
]

{ #category : 'as yet unclassified' }
Game >> checkLapFor: aShip [
    (board hasCompletedLap: aShip position) ifTrue: [ 
        aShip addLap.
        aShip moveTo: (board wrapPosition: aShip position) ].
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
	lapsToWin := 1.
	turnIndex := 1
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

{ #category : 'initialization' }
Game >> moveAllShipsExcept: aShip back: aNumber [
    ships do: [ :ship |
        ship = aShip ifFalse: [
            ship moveTo: (board wrapPosition: ship position - aNumber)] ].
	
]

{ #category : 'initialization' }
Game >> moveAllShipsToStart [
	ships do: [ :ship | ship moveTo: 1 ].
	
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip by: aNumber [
    | newPosition |
    newPosition := aShip position + aNumber.
    (board hasCompletedLap: newPosition) ifTrue: [ aShip addLap ].
    aShip moveTo: (board wrapPosition: newPosition).
]

{ #category : 'as yet unclassified' }
Game >> playTurn [
    | currentShip totalRoll |
    self hasFinished ifTrue: [Error signal: 'The game has already finished'].
    currentShip := ships at: turnIndex.
    totalRoll := self rollAllTheDice.
    self moveShip: currentShip by: totalRoll.
    (board effectAt: currentShip position) applyTo: currentShip on: self.
    turnIndex := (turnIndex rem: ships size) + 1.
]

{ #category : 'as yet unclassified' }
Game >> positionOf: aShip [

	^ aShip position
]

{ #category : 'as yet unclassified' }
Game >> rankOf: aShip [
    | sorted |
    sorted := ships asSortedCollection: [ :a :b | 
        a laps = b laps 
            ifTrue: [ a position > b position ]
            ifFalse: [ a laps > b laps ] ].
    ^ sorted indexOf: aShip.
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
