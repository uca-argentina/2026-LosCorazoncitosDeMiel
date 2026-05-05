Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> with: aSquareCount [
	aSquareCount > 0 ifTrue: [ ^ self new initializeWith: aSquareCount ]
	ifFalse: [Error signal: 'The number of squares must be greater than 0']
]

{ #category : 'as yet unclassified' }
Board >> hasReachedGoal: aPosition [
	^ aPosition >= squares.
]

{ #category : 'initialization' }
Board >> initializeWith: aSquareCount [
    squares := aSquareCount
]

{ #category : 'as yet unclassified' }
Board >> squareCount [

	^ squares 
]
