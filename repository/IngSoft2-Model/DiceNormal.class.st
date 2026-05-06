Class {
	#name : 'DiceNormal',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
DiceNormal class >> with: faces [ 
	
	faces>=3 ifTrue: [^ self new initializeWith: faces] ifFalse:[Error signal: 'A dice must have at least 3 faces'] 
]

{ #category : 'accessing' }
DiceNormal >> faces [
	^ faces 
]

{ #category : 'initialization' }
DiceNormal >> initializeWith: anInteger [ 
	faces:= anInteger .
]

{ #category : 'as yet unclassified' }
DiceNormal >> roll [

	^ (1 to: faces) atRandom
]
