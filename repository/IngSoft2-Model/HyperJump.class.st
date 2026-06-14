Class {
	#name : 'HyperJump',
	#superclass : 'Effect',
	#instVars : [
		'parsecs',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
HyperJump class >> withParsecs: aCollection [ 
	^ self new initializeWith: aCollection.
]

{ #category : 'applying' }
HyperJump >> applyTo: aShip on: aGame [
    
	| steps |
    steps := aGame squaresFor: (parsecs at: currentIndex).
    aGame moveShip: aShip by: steps.
    currentIndex := (currentIndex rem: parsecs size) + 1.
]

{ #category : 'initialization' }
HyperJump >> initializeWith: aCollection [
	parsecs := (aCollection collect: [:each | (each isKindOf: DistanceUnit) ifTrue: [each inParsecs] ifFalse: [each]]) asSortedCollection: [ :a :b | a > b ].
	currentIndex := 1
]
