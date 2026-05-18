Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'totalParsecs',
		'effects'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> with: aSquareCount parsecs: aParsecCount effects: aCollection [ 
    aSquareCount > 0 ifTrue: [ ^ self new initializeWith: aSquareCount parsecs: aParsecCount effects: aCollection ]
	ifFalse: [Error signal: 'The number of squares must be greater than 0']
]

{ #category : 'as yet unclassified' }
Board >> effectAt: aPosition [
    ^ effects at: aPosition
]

{ #category : 'as yet unclassified' }
Board >> hasCompletedLap: newPosition [
    ^ newPosition > squares
]

{ #category : 'as yet unclassified' }
Board >> hasShipReachedGoal: aShip withLaps: aLapCount [
    ^ aShip laps >= aLapCount
]

{ #category : 'initialization' }
Board >> initializeWith: aSquareCount parsecs: aParsecCount effects: aCollection [
    squares := aSquareCount.
    totalParsecs := aParsecCount.
		effects := aCollection.
]

{ #category : 'as yet unclassified' }
Board >> randomEffect [
    | roll |
    roll := (1 to: 100) atRandom.
    roll <= 2 ifTrue: [ ^ AtomicBomb new ].
    roll <= 12 ifTrue: [ ^ MoonWalk withSteps: (1 to: 10) atRandom ].
    roll <= 32 ifTrue: [ ^ WormHole new ].
    roll <= 52 ifTrue: [ ^ SpeedUp new ].
    roll <= 60 ifTrue: [ ^ HyperJump withParsecs: {10. 5. 2} ].
    ^ NoEffect new.
]

{ #category : 'as yet unclassified' }
Board >> squareCount [

	^ squares 
]

{ #category : 'initialization' }
Board >> squaresFor: aParsecAmount [
    ^ aParsecAmount / (totalParsecs / squares)
]

{ #category : 'as yet unclassified' }
Board >> wrapPosition: aPosition [
    ^ ((aPosition - 1) \\ squares) + 1
]
