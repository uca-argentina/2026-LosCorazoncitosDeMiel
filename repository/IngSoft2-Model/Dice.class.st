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
	
	faces>0 ifTrue: [^ self new initializeWith: faces] ifFalse:[Error signal: 'No existen dados de 0 caras'] 
 
]

{ #category : 'as yet unclassified' }
Dice >> faces [
	^ faces 
]

{ #category : 'initialization' }
Dice >> initializeWith: anInteger [ 
	faces:= anInteger .
]

{ #category : 'as yet unclassified' }
Dice >> roll [
	^ (1 to: faces ) atRandom 
]
