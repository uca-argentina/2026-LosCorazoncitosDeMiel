Class {
	#name : 'Redo',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
Redo >> applyOnPlayTo: aTarget inGame: aGame [
	aGame lastPlayedCard applyOnPlayTo: aTarget inGame: aGame
]

{ #category : 'applying' }
Redo >> rememberIn: aGame [
]
