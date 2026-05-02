Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'dice',
		'board',
		'turnIndex',
		'finishedShips'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withShips: aCollection dice: aCollection2 board: aBoard [ 
	^ self new initializeWithShips: aCollection dice: aCollection2 board: aBoard.
]

{ #category : 'as yet unclassified' }
Game >> agregarGanadores: currentShip [

	^ (board hasReachedGoal: currentShip position) ifTrue: [
		  finishedShips add: currentShip ]
]

{ #category : 'testing' }
Game >> hasFinished [
	^ ships anySatisfy: [:ship | board hasReachedGoal: ship position].
]

{ #category : 'initialization' }
Game >> initializeWithShips: someShips dice: someDice board: aBoard [ 
	ships:= someShips .
	dice:= someDice.
	board:= aBoard.
	turnIndex := 1.
	finishedShips := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Game >> playTurn [

	| currentShip totalRoll |
	self hasFinished ifTrue: [Error signal: 'El juego ya termino.'].
	currentShip := ships at: turnIndex.
	totalRoll := self rollAllTheDice.
	currentShip advanceBy: totalRoll.
	self agregarGanadores: currentShip.
	turnIndex := (turnIndex rem: ships size) + 1
]

{ #category : 'as yet unclassified' }
Game >> positionOf: aShip [ 
	^ aShip position.
]

{ #category : 'as yet unclassified' }
Game >> rollAllTheDice [

	^ dice inject: 0 into: [ :sum :aDie | sum + aDie roll ]
]

{ #category : 'as yet unclassified' }
Game >> winner [
	^finishedShips first.
]
