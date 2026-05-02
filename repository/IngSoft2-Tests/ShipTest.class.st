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
ShipTest >> test002WhenShipAdvancesBy3ThenPositionIs4 [
    | aShip |
    aShip := Ship new.
    aShip advanceBy: 3.
    self assert: aShip position equals: 4.
]
