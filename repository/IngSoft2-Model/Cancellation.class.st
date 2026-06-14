Class {
	#name : 'Cancellation',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
Cancellation >> applyOnPlayTo: aTarget inGame: aGame [
	aGame removeActiveCard: aTarget
]
