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
BoardTests >> test001WhenBoardIsCreatedWithZeroSquaresThenRaisesError [
    self
        should: [ Board with: 0 parsecs:100 ]
        raise: Error
        withMessageText: 'The number of squares must be greater than 0'.


]

{ #category : 'tests' }
BoardTests >> test002WhenBoardIsCreatedWithNegativeSquaresThenRaisesError [
    self
        should: [ Board with: -5 parsecs:100 ]
        raise: Error
        withMessageText: 'The number of squares must be greater than 0'
]

{ #category : 'tests' }
BoardTests >> test003WhenInitializeBoardWith10CellsThenSquareCountEqualsTo10 [
    
	| aBoard |
 
   	aBoard := Board with: 10 parsecs:100 .
   self assert: aBoard squareCount equals: 10.
]

{ #category : 'tests' }
BoardTests >> test004WhenInitializeBoardWithNegativeNumberThenRaiseAnError [
    
	| aBoard |
   
	self
        should: [ aBoard := Board with: -10 parsecs:100 . ]
        raise: Error
        withMessageText: 'The number of squares must be greater than 0'
]

{ #category : 'tests' }
BoardTests >> test005WhenPositionIsLessThanSquaresThenHasNotReachedGoal [
    | board ship |
    board := Board with: 10 parsecs:100 .
	 ship := Ship named: 'Ship2'.
    self deny: (board hasShipReachedGoal: ship withLaps: 2).
]

{ #category : 'tests' }
BoardTests >> test006WhenShipHasCompletedRequiredLapsThenHasReachedGoal [
    | board ship |
    board := Board with: 10 parsecs:100 .
    ship := Ship named: 'Ship2'.
    ship addLap.
    self assert: (board hasShipReachedGoal: ship withLaps: 1)..
]

{ #category : 'tests' }
BoardTests >> test007WhenShipHasMoreLapsThanRequiredThenHasReachedGoal [
    | board ship |
    board := Board with: 10 parsecs:100 .
    ship := Ship named: 'Ship2'.
    ship addLap.
    ship addLap.
    self assert: (board hasShipReachedGoal: ship withLaps: 1).
]
