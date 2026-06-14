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

{ #category : 'accessing' }
Board >> effectAt: aPosition [
    ^ effects at: aPosition
]

{ #category : 'testing' }
Board >> hasCompletedLap: newPosition [
    ^ newPosition > squares
]

{ #category : 'testing' }
Board >> hasShipReachedGoal: aShip withLaps: aLapCount [
    ^ aShip laps >= aLapCount
]

{ #category : 'accessing' }
Board >> initializeWith: aSquareCount parsecs: aParsecCount effects: aCollection [
    squares := aSquareCount.
    totalParsecs := aParsecCount.
		effects := aCollection.
]

{ #category : 'accessing' }
Board >> lapsCompletedFor: aPosition [
    ^ (aPosition - 1) // squares
]

{ #category : 'accessing' }
Board >> squareCount [

	^ squares 
]

{ #category : 'accessing' }
Board >> squaresFor: aParsecAmount [
    ^ aParsecAmount / (totalParsecs / squares)
]

{ #category : 'accessing' }
Board >> wrapPosition: aPosition [
    ^ ((aPosition - 1) \\ squares) + 1
]
