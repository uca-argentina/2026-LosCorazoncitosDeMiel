Class {
	#name : 'DiceNormal',
	#superclass : 'Dice',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
DiceNormal >> roll [
	^ (1 to: faces ) atRandom 
]
