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
        should: [ Board with: 0 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) ]
        raise: Error
        withMessageText: 'The number of squares must be greater than 0'.


]

{ #category : 'tests' }
BoardTests >> test002WhenBoardIsCreatedWithNegativeSquaresThenRaisesError [
    self
        should: [ Board with: -5 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) ]
        raise: Error
        withMessageText: 'The number of squares must be greater than 0'
]

{ #category : 'tests' }
BoardTests >> test003WhenInitializeBoardWith10CellsThenSquareCountEqualsTo10 [
    
	| aBoard |
 
   	aBoard := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
   self assert: aBoard squareCount equals: 10.
]

{ #category : 'tests' }
BoardTests >> test004WhenInitializeBoardWithNegativeNumberThenRaiseAnError [
    
	| aBoard |
   
	self
        should: [ aBoard := Board with: -10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new). ]
        raise: Error
        withMessageText: 'The number of squares must be greater than 0'
]

{ #category : 'tests' }
BoardTests >> test005WhenPositionIsLessThanSquaresThenHasNotReachedGoal [
    | board ship |
    board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
	 ship := Ship named: 'Ship2'.
    self deny: (board hasShipReachedGoal: ship withLaps: 2).
]

{ #category : 'tests' }
BoardTests >> test006WhenShipHasCompletedRequiredLapsThenHasReachedGoal [
    | board ship |
    board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new).
    ship := Ship named: 'Ship2'.
    ship addLap.
    self assert: (board hasShipReachedGoal: ship withLaps: 1)..
]

{ #category : 'tests' }
BoardTests >> test007WhenShipHasMoreLapsThanRequiredThenHasReachedGoal [
    | board ship |
    board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
    ship := Ship named: 'Ship2'.
    ship addLap.
    ship addLap.
    self assert: (board hasShipReachedGoal: ship withLaps: 1).
]

{ #category : 'tests' }
BoardTests >> test008WhenBoardIsCreatedWithLightYearsThenItsTotalDistanceMatches [
	| aBoard |
	aBoard := Board with: 10 parsecs: (LightYear of: 30) effects: (Array new: 10 withAll: NoEffect new).
	self assert: (aBoard squaresFor: 5) equals: 5
]

{ #category : 'tests' }
BoardTests >> test009WhenBoardIsCreatedWithParsecsAsUnitThenItWorksTheSameAsWithInteger [
	| boardWithUnit boardWithInteger |
	
	boardWithUnit := Board with: 10 parsecs: (Parsec of: 10) effects: (Array new: 10 withAll: NoEffect new).
	boardWithInteger := Board with: 10 parsecs: 10 effects: (Array new: 10 withAll: NoEffect new).
	
	self assert: (boardWithUnit squaresFor: 5) equals: (boardWithInteger squaresFor: 5)
]
