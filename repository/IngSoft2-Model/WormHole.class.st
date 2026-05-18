Class {
	#name : 'WormHole',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
WormHole >> applyTo: aShip on: aGame [
    aGame moveShip: aShip by: -4.
]
