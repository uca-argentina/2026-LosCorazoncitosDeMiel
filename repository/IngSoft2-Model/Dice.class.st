Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'numberOfTheDice'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Dice class >> with: faces [ 
	^ self new initializeWith: faces. 
]

{ #category : 'as yet unclassified' }
Dice >> caras [
	^ numberOfTheDice 
]

{ #category : 'initialization' }
Dice >> initializeWith: anInteger [ 
	numberOfTheDice:= anInteger .
]

{ #category : 'as yet unclassified' }
Dice >> throw [
	^ (1 to: numberOfTheDice ) atRandom 
]
