Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'casilleros'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> with: aCasilleros [ 
	aCasilleros > 0 ifTrue: [^self new initializeWith: aCasilleros] ifFalse: [ Error signal: 'El numero de inicializacion tiene que ser mayor a 0'] .
	
]

{ #category : 'as yet unclassified' }
Board >> cantidadDeCasilleros [
	^casilleros.
]

{ #category : 'as yet unclassified' }
Board >> hasReachedGoal: aPosition [
	^ aPosition >= casilleros.
]

{ #category : 'initialization' }
Board >> initializeWith: aCasilleros [ 
	casilleros := aCasilleros
]
