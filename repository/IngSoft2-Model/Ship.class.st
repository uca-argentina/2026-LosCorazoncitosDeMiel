Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'laps',
		'name',
		'hand'
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

{ #category : 'accessing' }
Ship >> hand [
	^ hand 
]

{ #category : 'initialization' }
Ship >> initializeNamed: aName [ 
	position := 1.
    laps := 0.
    name := aName.
	 hand := OrderedCollection new.
]

{ #category : 'testing' }
Ship >> isAheadOf: anotherShip [
    laps = anotherShip laps
        ifTrue: [ ^ position > anotherShip position ]
        ifFalse: [ ^ laps > anotherShip laps ]
]

{ #category : 'accessing' }
Ship >> laps [
	^ laps
]

{ #category : 'moving' }
Ship >> moveTo: aPosition [
    position := aPosition
]

{ #category : 'accessing' }
Ship >> name [
	^ name
]

{ #category : 'initialization' }
Ship >> position [

	^ position
]

{ #category : 'adding' }
Ship >> receive: aCard [ 
	hand add: aCard
]
