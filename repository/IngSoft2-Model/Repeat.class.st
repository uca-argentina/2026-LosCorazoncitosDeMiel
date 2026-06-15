Class {
	#name : 'Repeat',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
Repeat >> applyOnPlayTo: aTarget inGame: aGame [
	aGame lastEffect applyTo: aTarget on: aGame
]
