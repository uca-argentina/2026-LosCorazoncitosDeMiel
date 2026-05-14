Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'laps',
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Ship class >> named: aName [ 
	^self new initializeNamed: aName.
]

{ #category : 'adding' }
Ship >> addLap [
	laps:= laps + 1.
]

{ #category : 'initialization' }
Ship >> initializeNamed: aName [ 
	position := 1.
    laps := 0.
    name := aName.
]

{ #category : 'accessing' }
Ship >> laps [
	^ laps
]

{ #category : 'as yet unclassified' }
Ship >> moveTo: aPosition [
    position := aPosition
]

{ #category : 'accessing' }
Ship >> name [
	^ name
]

{ #category : 'instance creation' }
Ship >> newPosition [
	self shouldBeImplemented.
]

{ #category : 'initialization' }
Ship >> position [
    ^ position
]
