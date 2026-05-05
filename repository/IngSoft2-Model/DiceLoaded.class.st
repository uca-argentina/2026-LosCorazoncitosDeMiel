Class {
	#name : 'DiceLoaded',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
DiceLoaded class >> with: value [ 
	
	value>0 ifTrue: [^ self new initializeWith: value] ifFalse:[Error signal: 'A loaded die must have a value greater than 0'] 
]

{ #category : 'initialization' }
DiceLoaded >> initializeWith: anInteger [ 
	value := anInteger .
]

{ #category : 'as yet unclassified' }
DiceLoaded >> roll [
	^value 
]
