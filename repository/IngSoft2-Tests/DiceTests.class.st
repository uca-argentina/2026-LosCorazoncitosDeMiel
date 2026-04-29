Class {
	#name : 'DiceTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
DiceTests >> test003WhenADiceIsInitializedWith6ThenWhenWeThrowTheNumberIsBetween1And6 [

	|Dice1|
	Dice1:= Dice with: 6.
	 
	self assert: ((Dice1 throw) between: 1 and: 6).
]

{ #category : 'running' }
DiceTests >> testWhenADiceIsInitializedThenFacesDoesntEquals5 [


	|Dice1|
	Dice1:= Dice new.
	self deny: Dice1 caras equals: 5.
		
]

{ #category : 'running' }
DiceTests >> testWhenADiceIsInitializedThenFacesEquals6 [

	|Dice1|
	Dice1:= Dice with: 6. 
	self assert: Dice1 caras equals: 6.
]
