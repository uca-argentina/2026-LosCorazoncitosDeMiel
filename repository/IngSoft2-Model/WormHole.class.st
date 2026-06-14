Class {
	#name : 'WormHole',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
WormHole >> applyTo: aShip on: aGame [
    aGame moveShip: aShip by: -4.
]
