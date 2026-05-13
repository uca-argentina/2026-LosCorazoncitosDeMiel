Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
ShipTest >> test001WhenWeCreateANewShipThenPositionIs1 [
    | aShip |
    aShip := Ship new.
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
    ship := Ship new.
    ship addLap.
    self assert: ship laps equals: 1.
]

{ #category : 'running' }
ShipTest >> test004WhenShipStartsGameThenLapsEquals0 [
    | ship |
    ship := Ship new.
    self assert: ship laps equals: 0.
]

{ #category : 'running' }
ShipTest >> test005WhenShipCompletesThreeLapsThenLapsEquals3 [
    | ship |
    ship := Ship new.
    ship addLap.
    ship addLap.
    ship addLap.
    self assert: ship laps equals: 3.
]
