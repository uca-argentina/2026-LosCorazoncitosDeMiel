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
BoardTests >> test001WhenSquareCountIsBiggerThan0ThenIsValid [

    | aBoard |
    aBoard := Board with: 5.
    self assert: aBoard squareCount > 0.
]

{ #category : 'tests' }
BoardTests >> test002WhenSquareCountIsSmallerThan0ThenIsInvalid [

    | aBoard |

    aBoard := Board with: 4.
    self deny: aBoard squareCount < 0.
]

{ #category : 'tests' }
BoardTests >> test003WhenInitializeBoardWith10CellsThenSquareCountEqualsTo10 [
    
	| aBoard |
 
   	aBoard := Board with: 10.
   self assert: aBoard squareCount equals: 10.
]

{ #category : 'tests' }
BoardTests >> test004WhenInitializeBoardWithNegativeNumberThenRaiseAnError [
    
	| aBoard |
   
	self
        should: [ aBoard := Board with: -10. ]
        raise: Error
        withMessageText: 'The number of squares must be greater than 0'
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
