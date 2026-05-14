Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Die class >> with: faces [ 
	
	faces>=3 ifTrue: [^ self new initializeWith: faces] ifFalse:[Error signal: 'A dice must have at least 3 faces'] 
]

{ #category : 'accessing' }
Die >> faces [
	^ faces 
]

{ #category : 'initialization' }
Die >> initializeWith: anInteger [ 
	faces:= anInteger .
]

{ #category : 'as yet unclassified' }
Die >> roll [

	^ (1 to: faces) atRandom
]
