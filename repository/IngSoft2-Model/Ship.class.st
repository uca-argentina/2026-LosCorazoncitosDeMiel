Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship >> advanceBy: aNumber [ 
	position := position + aNumber.
]

{ #category : 'initialization' }
Ship >> initialize [
    position := 1
]

{ #category : 'initialization' }
Ship >> position [
    ^ position
]
