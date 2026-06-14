Class {
	#name : 'DiceTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
DiceTests >> should: aFullBlockClosure raise: anError withMessageText: message [ 
	self 
	should:  aFullBlockClosure 
	raise: anError
	withExceptionDo: [ :error | self assert: error messageText equals: message ].
]

{ #category : 'running' }
DiceTests >> test001WhenWeInitializeADiceWithZeroFacesThenRaiseError [

	self
	should: [Die with: 0] 
	raise: Error
	withMessageText: 'A dice must have at least 3 faces'
]

{ #category : 'running' }
DiceTests >> test003WhenADiceIsInitializedWith6ThenWhenWeRollTheNumberIsBetween1And6 [

	|aDice|
	aDice:= Die with: 6.
	 
	self assert: ((aDice roll) between: 1 and: 6).
]

{ #category : 'running' }
DiceTests >> test004WhenADiceIsInitializedThenFacesEquals6 [

	|aDice|
	aDice:= Die with: 6. 
	self assert: aDice faces equals: 6.
]
