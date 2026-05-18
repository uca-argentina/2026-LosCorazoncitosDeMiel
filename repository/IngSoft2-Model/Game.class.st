Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'dice',
		'board',
		'turnIndex',
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
Game class >> withShips: arg1 dice: arg2 board: arg3 laps: arg4 [

	arg1 isEmpty ifTrue: [
		Error signal: 'Game must have at least one ship' ].
	arg2 isEmpty ifTrue: [
		Error signal: 'Game must have at least one dice' ].
	^ self new
		  initializeWithShips: arg1
		  dice: arg2
		  board: arg3
		  laps: arg4
]

{ #category : 'as yet unclassified' }
Game >> board [

	^ board
]

{ #category : 'testing' }
Game >> hasFinished [

	^ ships anySatisfy: [ :arg1 |
		  board hasShipReachedGoal: arg1 withLaps: lapsToWin ]
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
Game >> initializeWithShips: arg1 dice: arg2 board: arg3 laps: arg4 [

	ships := arg1.
	dice := arg2.
	board := arg3.
	lapsToWin := arg4.
	turnIndex := 1
]

{ #category : 'as yet unclassified' }
Game >> lapsOf: arg1 [

	^ arg1 laps
]

{ #category : 'initialization' }
Game >> moveAllShipsExcept: aShip back: aNumber [
    ships do: [ :ship |
        ship = aShip ifFalse: [
            ship moveTo: (board wrapPosition: ship position - aNumber)] ].
	
]

{ #category : 'initialization' }
Game >> moveAllShipsToStart [

	ships do: [ :arg1 | arg1 moveTo: 1 ]
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
Game >> rankOf: arg1 [

	| tmp1 |
	tmp1 := ships asSortedCollection: [ :arg2 :arg3 |
			        arg2 laps = arg3 laps
				        ifTrue: [ arg2 position > arg3 position ]
				        ifFalse: [ arg2 laps > arg3 laps ] ].
	^ tmp1 indexOf: arg1
]

{ #category : 'as yet unclassified' }
Game >> rollAllTheDice [

	^ dice inject: 0 into: [ :sum  :aDie | sum  + aDie roll ]
]

{ #category : 'as yet unclassified' }
Game >> winner [

	^ ships
		  detect: [ :arg1 |
		  board hasShipReachedGoal: arg1 withLaps: lapsToWin ]
		  ifNone: [ Error signal: 'The game has not finished yet' ]
]
