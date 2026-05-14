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
    aShip := Ship new.
    aShip moveTo: 4.
    self assert: aShip position equals: 4.
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
