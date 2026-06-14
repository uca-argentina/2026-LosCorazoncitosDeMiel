Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'dice',
		'board',
		'turnIndex',
		'lapsToWin',
		'activeCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Game class >> withShips: someShips dice: someDice board: aBoard [
	someShips isEmpty ifTrue: [ Error signal: 'Game must have at least one ship'].
	someDice isEmpty ifTrue: [ Error signal: 'Game must have at least one dice'].
	^ self new initializeWithShips: someShips dice: someDice board: aBoard 
]

{ #category : 'instance creation' }
Game class >> withShips: someShips dice: someDice board: aBoard laps: aLapCount [
    someShips isEmpty ifTrue: [ Error signal: 'Game must have at least one ship' ].
    someDice isEmpty ifTrue: [ Error signal: 'Game must have at least one dice' ].
    ^ self new initializeWithShips: someShips dice: someDice board: aBoard laps: aLapCount
]

{ #category : 'accessing' }
Game >> activeCards [
	^ activeCards
]

{ #category : 'playing' }
Game >> addActiveCard: aCard [
	activeCards add: aCard
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
Game >> initializeWithShips: someShips dice: someDice board: aBoard laps: aLapCount [
    ships := someShips.
    dice := someDice.
    board := aBoard.
    lapsToWin := aLapCount.
    turnIndex := 1.
	 activeCards := OrderedCollection new
]

{ #category : 'accessing' }
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

{ #category : 'moving' }
Game >> moveShip: aShip by: aNumber [
    | newPosition lapsCompleted |
    newPosition := aShip position + aNumber.
    lapsCompleted := board lapsCompletedFor: newPosition.
    lapsCompleted timesRepeat: [ aShip addLap ].
    aShip moveTo: (board wrapPosition: newPosition).
]

{ #category : 'playing' }
Game >> play: aCard from: aShip target: aTarget [
	aCard applyOnPlayTo: aTarget inGame: self
]

{ #category : 'playing' }
Game >> playTurn [

	| currentShip totalRoll |
	self hasFinished ifTrue: [
		Error signal: 'The game has already finished' ].
	currentShip := ships at: turnIndex.
	totalRoll := self rollAllTheDice.
	self moveShip: currentShip by: totalRoll.
	board applyEffectOf: currentShip position to: currentShip on: self.
	turnIndex := (turnIndex rem: ships size) + 1
]

{ #category : 'accessing' }
Game >> positionOf: aShip [

	^ aShip position
]

{ #category : 'accessing' }
Game >> rankOf: aShip [
    | rankedShips |
    rankedShips := ships asSortedCollection: [ :aShip :anotherShip |
        aShip isAheadOf: anotherShip ].
    ^ rankedShips indexOf: aShip
]

{ #category : 'playing' }
Game >> removeActiveCard: aCard [
	activeCards remove: aCard
]

{ #category : 'playing' }
Game >> rollAllTheDice [

	^ dice inject: 0 into: [ :sum  :aDie | sum  + aDie roll ]
]

{ #category : 'accessing' }
Game >> squaresFor: aParsecAmount [
    ^ board squaresFor: aParsecAmount
]

{ #category : 'accessing' }
Game >> winner [
    ^ ships
        detect: [ :aShip |
            board hasShipReachedGoal: aShip withLaps: lapsToWin ]
        ifNone: [ Error signal: 'The game has not finished yet' ]
]
