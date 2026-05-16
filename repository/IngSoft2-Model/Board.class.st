Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'totalParsecs'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> with: aSquareCount parsecs: aParsecCount [
    aSquareCount > 0 ifTrue: [ ^ self new initializeWith: aSquareCount parsecs: aParsecCount ]
	ifFalse: [Error signal: 'The number of squares must be greater than 0']
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
Board >> initializeWith: aSquareCount parsecs: aParsecCount [
    squares := aSquareCount.
    totalParsecs := aParsecCount.
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
