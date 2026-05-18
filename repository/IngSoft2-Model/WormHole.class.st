Class {
	#name : 'WormHole',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
WormHole >> applyTo: aShip on: aGame [
	
    | newPosition |
newPosition := aShip position - 4.
    aShip moveTo: (aGame board wrapPosition: newPosition).
]
