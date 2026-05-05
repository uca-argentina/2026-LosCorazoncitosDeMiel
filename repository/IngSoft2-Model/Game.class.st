Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'dice',
		'board',
		'turnIndex'
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

{ #category : 'testing' }
Game >> hasFinished [

	^ ships anySatisfy: [ :ship | board hasReachedGoal: ship position ]
]

{ #category : 'initialization' }
Game >> initializeWithShips: someShips dice: someDice board: aBoard [
    ships := someShips.
    dice := someDice.
    board := aBoard.
    turnIndex := 1.
	
]

{ #category : 'as yet unclassified' }
Game >> playTurn [

	| currentShip totalRoll |
	self hasFinished ifTrue: [Error signal: 'The game has already finished'].
	currentShip := ships at: turnIndex.
	totalRoll := self rollAllTheDice.
	currentShip advanceBy: totalRoll.
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
	detect: [:ship | board hasReachedGoal: ship position ]
	ifNone: [Error signal: 'The game has not finished yet']
]
