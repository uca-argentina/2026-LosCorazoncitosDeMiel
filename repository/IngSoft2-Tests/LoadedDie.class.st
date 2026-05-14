Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'instance creation' }
LoadedDie class >> with: value [ 
	
	value>0 ifTrue: [^ self new initializeWith: value] ifFalse:[Error signal: 'A loaded die must have a value greater than 0'] 
]

{ #category : 'initialization' }
LoadedDie >> initializeWith: anInteger [ 
	value := anInteger .
]

{ #category : 'as yet unclassified' }
LoadedDie >> roll [
	^value 
]
