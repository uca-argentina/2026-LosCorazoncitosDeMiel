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
