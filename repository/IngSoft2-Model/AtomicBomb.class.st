Class {
	#name : 'AtomicBomb',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
AtomicBomb >> applyTo: aShip on: aGame [ 
	aGame moveAllShipsToStart.
]
