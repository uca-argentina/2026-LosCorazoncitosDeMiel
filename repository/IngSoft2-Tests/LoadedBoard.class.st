Class {
	#name : 'LoadedBoard',
	#superclass : 'Board',
	#instVars : [
		'value'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
LoadedBoard class >> with: aSquareCount parsecs: aParsecCount effects: aCollection [
    ^ self new initializeWith: aSquareCount parsecs: aParsecCount effects: aCollection.
]
