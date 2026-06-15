Class {
	#name : 'Card',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
Card >> applyOnPlayTo: aTarget inGame: aGame [
	aGame addActiveCard: self
]

{ #category : 'applying' }
Card >> rememberIn: aGame [
	aGame registerLastPlayedCard: self
]
