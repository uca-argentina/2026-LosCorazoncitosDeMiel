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

	| aTablero |
	aTablero := Board with: 5.
	
	self assert: ((aTablero cantidadDeCasilleros)>0).
]

{ #category : 'tests' }
BoardTests >> test002henCantidadDeCasillerosIsSmallerThan0ThenIsInvalid [

	| aTablero |
	aTablero := Board with: 4.
	
	self deny: ((aTablero cantidadDeCasilleros)<0).
]

{ #category : 'tests' }
BoardTests >> test003WhenInitializeBoardWith10CellsThenCantidadDeCasillerosEqualsTo10 [

	| aTablero |
	aTablero := Board with: 10.
	
	self assert: (aTablero cantidadDeCasilleros) equals:10.
]

{ #category : 'tests' }
BoardTests >> test004WhenInitializeBoardWithNegativeNumberThenRaiseAnError [

	| aTablero |
	self
	should: [ aTablero := Board with: -10.] 
	raise: Error 
	withMessageText: 'El numero de inicializacion tiene que ser mayor a 0'
]

{ #category : 'tests' }
BoardTests >> test005WhenPositionIsLessThanSquaresThenHasNotReachedGoal [
    | board |
    board := Board with: 10.
    self deny: (board hasReachedGoal: 5).
]

{ #category : 'tests' }
BoardTests >> test006WhenPositionIsEqualToSquaresThenHasReachedGoal [
    | board |
    board := Board with: 10.
    self assert: (board hasReachedGoal: 10).
]

{ #category : 'tests' }
BoardTests >> test007WhenPositionIsGreaterThanSquaresThenHasReachedGoal [
    | board |
    board := Board with: 10.
    self assert: (board hasReachedGoal: 15)
]
