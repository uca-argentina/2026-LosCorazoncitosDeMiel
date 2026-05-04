Class {
	#name : 'DiceLoadedTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
DiceLoadedTests >> should: aFullBlockClosure raise: anError withMessageText: message [ 
	self
	should: aFullBlockClosure
	raise: anError
	withExceptionDo: [: error | self assert: error messageText equals: message]
]

{ #category : 'running' }
DiceLoadedTests >> test001WhenWeInitializeADiceLoadedWithZeroValueThenRaiseError [
	self
		should: [DiceLoaded with: 0] 
		raise: Error
		withMessageText: 'A die must have at least 2 faces'
]

{ #category : 'running' }
DiceLoadedTests >> test002WhenWeRollADiceLoadedWith5ThenReturns5 [

	|aDiceLoaded|
	aDiceLoaded := DiceLoaded with:5.
	self assert: aDiceLoaded roll equals:5.
]

{ #category : 'running' }
DiceLoadedTests >> test003WhenWeRollADiceLoadedMultipleTimesThenAlwaysReturnsSameValue [

	|aDiceLoaded|
	aDiceLoaded := DiceLoaded with:5.
	self assert: aDiceLoaded roll equals:5.
	self assert: aDiceLoaded roll equals:5.
	self assert: aDiceLoaded roll equals:5.
]
