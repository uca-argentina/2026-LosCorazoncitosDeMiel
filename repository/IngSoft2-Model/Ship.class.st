Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'adding' }
Ship >> addLap [
	laps:= laps + 1.
]

{ #category : 'initialization' }
Ship >> initialize [
    position := 1.
	 laps := 0.
]

{ #category : 'accessing' }
Ship >> laps [
	^ laps
]

{ #category : 'as yet unclassified' }
Ship >> moveTo: aPosition [
    position := aPosition
]

{ #category : 'instance creation' }
Ship >> newPosition [
	self shouldBeImplemented.
]

{ #category : 'initialization' }
Ship >> position [
    ^ position
]
