Class {
	#name : 'MoonWalk',
	#superclass : 'Effect',
	#instVars : [
		'steps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> withSteps: aNumber [ 
	^ self new initializeWith: aNumber
]

{ #category : 'initialization' }
MoonWalk >> applyTo: aShip on: aGame [
    aGame moveAllShipsExcept: aShip back: steps.
]

{ #category : 'initialization' }
MoonWalk >> initializeWith: aNumber [
    steps := aNumber.
]
