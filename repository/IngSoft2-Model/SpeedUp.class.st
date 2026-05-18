Class {
	#name : 'SpeedUp',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
SpeedUp >> applyTo: aShip on: aGame [ 
	aShip moveTo: (aGame board wrapPosition: aShip position + 4).
]
