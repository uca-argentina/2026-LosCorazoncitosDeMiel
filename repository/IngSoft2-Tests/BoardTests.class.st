Class {
	#name : 'BoardTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
BoardTests >> should: aBlock raise: anErrorClass withMessageText: aMessage [
	self
		should: aBlock 
		raise: anErrorClass 
		withExceptionDo: [ :error | self assert: error messageText equals: aMessage ].
]

{ #category : 'tests' }
BoardTests >> test001WhenCantidadDeCasillerosIsBiggerThan0ThenIsValid [

	| aBoard |
	aBoard := Board with: 5.
	
	self assert: ((aBoard squareCount)>0).
]

{ #category : 'tests' }
BoardTests >> test002henCantidadDeCasillerosIsSmallerThan0ThenIsInvalid [

	| aBoard |
	aBoard := Board with: 4.
	
	self deny: ((aBoard squareCount)<0).
]

{ #category : 'tests' }
BoardTests >> test003WhenInitializeBoardWith10CellsThenCantidadDeCasillerosEqualsTo10 [

	| aBoard |
	aBoard := Board with: 10.
	
	self assert: (aBoard squareCount) equals:10.
]

{ #category : 'tests' }
BoardTests >> test004WhenInitializeBoardWithNegativeNumberThenRaiseAnError [

	| aBoard |
	self
	should: [ aBoard := Board with: -10.] 
	raise: Error 
	withMessageText: 'A board must have at least 1 square'
]
