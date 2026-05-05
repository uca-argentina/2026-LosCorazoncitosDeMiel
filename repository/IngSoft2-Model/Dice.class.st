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
	
	faces>=2 ifTrue: [^ self new initializeWith: faces] ifFalse:[Error signal: 'A dice must have at least 2 faces'] 
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
