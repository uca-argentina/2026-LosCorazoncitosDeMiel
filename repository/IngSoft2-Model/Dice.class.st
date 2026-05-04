Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Dice class >> with: faces [ 
	
	faces<2 ifTrue: [Error signal: 'A die must have at least 2 faces'] .
	^ self new initializeWith: faces
]

{ #category : 'as yet unclassified' }
Dice >> faces [
	^ faces 
]

{ #category : 'as yet unclassified' }
Dice >> initializeWith: anInteger [ 
	faces:= anInteger .
]

{ #category : 'as yet unclassified' }
Dice >> roll [
	self subclassResponsibility.
]
