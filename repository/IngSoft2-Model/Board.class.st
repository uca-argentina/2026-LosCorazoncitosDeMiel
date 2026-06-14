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

    aSquareCount > 0 ifFalse: [ Error signal: 'The number of squares must be greater than 0' ].
    aParsecCount > 0 ifFalse: [ Error signal: 'Parsecs must be greater than 0' ].
    aCollection size = aSquareCount ifFalse: [ Error signal: 'Effects count must match square count' ].
    
	^ self new initializeWith: aSquareCount parsecs: aParsecCount effects: aCollection
]

{ #category : 'as yet unclassified' }
Board >> applyEffectOf: aPosition to: aShip on: aGame [
    (effects at: aPosition) applyTo: aShip on: aGame
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
Board >> lapsCompletedFor: aPosition [
    ^ (aPosition - 1) // squares
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
