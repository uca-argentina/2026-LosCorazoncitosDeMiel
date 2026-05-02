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
Game class >> withShips: aCollection dice: aCollection2 board: aBoard [ 
	^ self new initializeWithShips: aCollection dice: aCollection2 board: aBoard.
]

{ #category : 'testing' }
Game >> hasFinished [
	^ ships anySatisfy: [:ship | board Hasfinished: ship position].
]

{ #category : 'initialization' }
Game >> initializeWithShips: someShips dice: someDice board: aBoard [ 
	ships:= someShips .
	dice:= someDice.
	board:= aBoard.
	turnIndex := 1.
]

{ #category : 'as yet unclassified' }
Game >> playTurn [
	| currentShip totalRoll |
	currentShip := ships at: turnIndex.
	totalRoll := dice inject: 0 into: [:sum :aDie | sum + aDie roll ].
	currentShip advanceBy: totalRoll.
	turnIndex:= (turnIndex rem: ships size) + 1.
]
