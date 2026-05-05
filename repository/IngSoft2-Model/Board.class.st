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
	aSquareCount < 1 ifTrue: [Error signal: 'A board must have at least 1 square'] .
	^self new initializeWith: aSquareCount
	
]

{ #category : 'initialization' }
Board >> initializeWith: aSquareCount [ 
	squares := aSquareCount
]

{ #category : 'as yet unclassified' }
Board >> squareCount [
	^squares.
]
