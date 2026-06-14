Class {
	#name : 'DistanceUnit',
	#superclass : 'Object',
	#instVars : [
		'quantity'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
DistanceUnit class >> of: aQuantity [
	^ self new initializeWith: aQuantity
]

{ #category : 'initialization' }
DistanceUnit >> inParsecs [
	^ self subclassResponsibility
]

{ #category : 'initialization' }
DistanceUnit >> initializeWith: aQuantity [
	quantity := aQuantity
]
