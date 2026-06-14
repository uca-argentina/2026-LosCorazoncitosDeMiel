Class {
	#name : 'GivesCard',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
GivesCard >> applyTo: aShip on: aGame [
	aShip receive: Speed new
]
