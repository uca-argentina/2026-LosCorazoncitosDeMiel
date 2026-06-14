Class {
	#name : 'MoonWalk',
	#superclass : 'Effect',
	#instVars : [
		'steps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
MoonWalk class >> withSteps: aNumber [ 
	^ self new initializeWith: aNumber
]

{ #category : 'applying' }
MoonWalk >> applyTo: aShip on: aGame [
    aGame moveAllShipsExcept: aShip back: steps.
]

{ #category : 'initialization' }
MoonWalk >> initializeWith: aNumber [
    steps := aNumber.
]
