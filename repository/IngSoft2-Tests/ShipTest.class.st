Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
ShipTest >> test001WhenWeCreateANewShipThenPositionIs1 [
    | aShip |
    aShip := Ship named: 'Ship1'.

    self assert: aShip position equals: 1.
]

{ #category : 'running' }
ShipTest >> test002WhenShipMovesToPosition4ThenPositionIs4 [

	| aShip |
	aShip := Ship named: 'Ship1'.
	aShip moveTo: 4.
	self assert: aShip position equals: 4
]

{ #category : 'running' }
ShipTest >> test003WhenShipCompletesALapThenLapsEquals1 [
    | ship |
    ship := Ship named: 'Ship1'.
    ship addLap.
    self assert: ship laps equals: 1.
]

{ #category : 'running' }
ShipTest >> test004WhenShipStartsGameThenLapsEquals0 [
    | ship |
    ship := Ship named: 'Ship1'.
    self assert: ship laps equals: 0.
]

{ #category : 'running' }
ShipTest >> test005WhenShipCompletesThreeLapsThenLapsEquals3 [
    | ship |
    ship := Ship named: 'Ship1'.
    ship addLap.
    ship addLap.
    ship addLap.
    self assert: ship laps equals: 3.
]

{ #category : 'running' }
ShipTest >> test006WhenShipIsCreatedWithNameThenNameIsCorrect [
    | ship |
    ship := Ship named: 'Enterprise'.
    self assert: ship name equals: 'Enterprise'.
]

{ #category : 'running' }
ShipTest >> test007WhenShipIsCreatedThenHandIsEmpty [
    | ship |
    ship := Ship named: 'Ship1'.
    self assert: ship hand isEmpty.
]

{ #category : 'running' }
ShipTest >> test008WhenShipReceivesACardThenHandContainsThatCard [
    | ship card |
    ship := Ship named: 'Ship1'.
    card := Card new.
    ship receive: card.
    self assert: (ship hand includes: card).
    self assert: ship hand size equals: 1.
]
