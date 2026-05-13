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

{ #category : 'as yet unclassified' }
Ship >> advanceBy: aNumber [ 
	position := position + aNumber.
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

{ #category : 'initialization' }
Ship >> position [
    ^ position
]
