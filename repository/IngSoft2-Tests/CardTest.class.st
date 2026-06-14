Class {
	#name : 'CardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardTest >> test001WhenASpeedCardIsAppliedToARollThenThatRollIsIncreasedByOne [
	| aShip aSpeedCard |
	aShip := Ship named: 'Enterprise'.
	aSpeedCard := Speed new.
	self assert: (aSpeedCard applyTo: 5 for: aShip) equals: 6
]

{ #category : 'tests' }
CardTest >> test002WhenAnOverloadCardIsAppliedToARollThenThatRollIsDecreasedByTwo [
	| aShip anOverloadCard |
	aShip := Ship named: 'Enterprise'.
	anOverloadCard := Overload new.
	self assert: (anOverloadCard applyTo: 5 for: aShip) equals: 3
]

{ #category : 'tests' }
CardTest >> test003WhenAnAccelerationCardIsAppliedToARollThenThatRollIsIncreasedByOne [
	| aShip anAccelerationCard |
	aShip := Ship named: 'Enterprise'.
	anAccelerationCard := Acceleration new.
	self assert: (anAccelerationCard applyTo: 5 for: aShip) equals: 6
]
