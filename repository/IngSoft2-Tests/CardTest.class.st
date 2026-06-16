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

{ #category : 'tests' }
CardTest >> test004WhenAPermanentCardIsPlayedThenItIsActiveInTheGame [
	| aShip aSpeedCard aGame aBoard |
	aShip := Ship named: 'Enterprise'.
	aBoard := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
	aGame := Game withShips: { aShip } dice: { Die with: 6 } board: aBoard laps: 1.
	aSpeedCard := Speed new.
	aGame play: aSpeedCard from: aShip target: aShip.
	self assert: (aGame activeCards includes: aSpeedCard)
]

{ #category : 'tests' }
CardTest >> test005WhenCancellationIsPlayedOnAnActiveCardThenThatCardIsNoLongerActive [
	| aShip aSpeedCard aCancellationCard aGame aBoard |
	aShip := Ship named: 'Enterprise'.
	aBoard := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
	aGame := Game withShips: { aShip } dice: { Die with: 6 } board: aBoard laps: 1.
	aSpeedCard := Speed new.
	aCancellationCard := Cancellation new.
	aGame play: aSpeedCard from: aShip target: aShip.
	aGame play: aCancellationCard from: aShip target: aSpeedCard.
	self deny: (aGame activeCards includes: aSpeedCard)
]

{ #category : 'tests' }
CardTest >> test006WhenRepeatIsPlayedThenItReappliesTheLastEffectToTheChosenShip [
	| aShip anotherShip aRepeat aGame aBoard effects |
	aShip := Ship named: 'Ship1'.
	anotherShip := Ship named: 'Ship2'.
	effects := Array new: 10 withAll: NoEffect new.
	effects at: 4 put: SpeedUp new.
	aBoard := Board with: 10 parsecs: 10 effects: effects.
	aGame := Game withShips: { aShip. anotherShip } dice: { LoadedDie with: 3 } board: aBoard laps: 2.
	
	aGame playTurn.
	aRepeat := Repeat new.
	aGame play: aRepeat from: anotherShip target: anotherShip.
	
	self assert: anotherShip position equals: 5
]

{ #category : 'tests' }
CardTest >> test007WhenRepeatIsPlayedAndNoShipHasRolledThenItHasNoEffect [
	| aShip aRepeat aGame aBoard |
	aShip := Ship named: 'Ship1'.
	aBoard := Board with: 10 parsecs: 10 effects: (Array new: 10 withAll: NoEffect new).
	aGame := Game withShips: { aShip } dice: { LoadedDie with: 3 } board: aBoard laps: 2.
	
	aRepeat := Repeat new.
	aGame play: aRepeat from: aShip target: aShip.
	
	self assert: aShip position equals: 1
]

{ #category : 'tests' }
CardTest >> test008WhenACardIsPlayedThenGameRemembersItAsLastPlayedCard [
	| aShip aSpeedCard aGame aBoard |
	aShip := Ship named: 'Ship1'.
	aBoard := Board with: 10 parsecs: 10 effects: (Array new: 10 withAll: NoEffect new).
	aGame := Game withShips: { aShip } dice: { LoadedDie with: 1 } board: aBoard laps: 2.
	
	aSpeedCard := Speed new.
	aGame play: aSpeedCard from: aShip target: aShip.
	
	self assert: aGame lastPlayedCard equals: aSpeedCard
]

{ #category : 'tests' }
CardTest >> test009WhenRedoIsPlayedThenItReplaysTheLastPlayedCard [
	| aShip aSpeedCard aRedo aGame aBoard |
	aShip := Ship named: 'Ship1'.
	aBoard := Board with: 10 parsecs: 10 effects: (Array new: 10 withAll: NoEffect new).
	aGame := Game withShips: { aShip } dice: { LoadedDie with: 1 } board: aBoard laps: 2.
	
	aSpeedCard := Speed new.
	aRedo := Redo new.
	aGame play: aSpeedCard from: aShip target: aShip.
	aGame play: aRedo from: aShip target: aShip.
	
	self assert: (aGame activeCards select: [:c | c isKindOf: Speed]) size equals: 2
]

{ #category : 'tests' }
CardTest >> test010WhenTwoRedosArePlayedThenBothReplayTheOriginalCard [
	| aShip aSpeedCard aRedo anotherRedo aGame aBoard |
	aShip := Ship named: 'Ship1'.
	aBoard := Board with: 10 parsecs: 10 effects: (Array new: 10 withAll: NoEffect new).
	aGame := Game withShips: { aShip } dice: { LoadedDie with: 1 } board: aBoard laps: 2.
	
	aSpeedCard := Speed new.
	aRedo := Redo new.
	anotherRedo := Redo new.
	aGame play: aSpeedCard from: aShip target: aShip.
	aGame play: aRedo from: aShip target: aShip.
	aGame play: anotherRedo from: aShip target: aShip.
	
	self assert: (aGame activeCards select: [:c | c isKindOf: Speed]) size equals: 3
]

{ #category : 'tests' }
CardTest >> test011WhenAccelerationAffectsAllShipsThenAllShipsGetPlusOne [
    | ship1 ship2 anAccelerationCard aGame aBoard |
    ship1 := Ship named: 'Ship1'.
    ship2 := Ship named: 'Ship2'.
    aBoard := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    aGame := Game withShips: { ship1. ship2 } dice: { LoadedDie with: 3 } board: aBoard laps: 2.
    anAccelerationCard := Acceleration new.
    aGame play: anAccelerationCard from: ship1 target: nil.
    aGame playTurn.
    self assert: ship1 position equals: 4.
]

{ #category : 'tests' }
CardTest >> test012WhenInstantCardIsPlayedThenItIsNotInActiveCards [
    | aShip aRepeat aGame aBoard |
    aShip := Ship named: 'Ship1'.
    aBoard := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    aGame := Game withShips: { aShip } dice: { LoadedDie with: 3 } board: aBoard laps: 2.
    aRepeat := Repeat new.
    aGame play: aRepeat from: aShip target: aShip.
    self deny: (aGame activeCards includes: aRepeat).
]

{ #category : 'tests' }
CardTest >> test013WhenCancellationIsPlayedWithNoActiveCardsThenRaisesError [
    | aShip aCancellationCard aGame aBoard |
    aShip := Ship named: 'Ship1'.
    aBoard := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    aGame := Game withShips: { aShip } dice: { LoadedDie with: 3 } board: aBoard laps: 2.
    aCancellationCard := Cancellation new.
    self should: [ aGame play: aCancellationCard from: aShip target: nil ] raise: Error.
]

{ #category : 'tests' }
CardTest >> test014WhenShipReceivesACardThenHandSizeIsOne [
    | aShip aCard |
    aShip := Ship named: 'Ship1'.
    aCard := Speed new.
    aShip receive: aCard.
    self assert: aShip hand size equals: 1.
]

{ #category : 'tests' }
CardTest >> test015WhenOverloadMakesRollNegativeThenShipGoesBack [
    | aShip anOverloadCard aGame aBoard |
    aShip := Ship named: 'Ship1'.
    aBoard := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    aGame := Game withShips: { aShip } dice: { LoadedDie with: 1 } board: aBoard laps: 2.
    anOverloadCard := Overload new.
    aGame play: anOverloadCard from: aShip target: aShip.
    aGame play: anOverloadCard from: aShip target: aShip.
    aGame playTurn.
    self assert: aShip position equals: 2.
]

{ #category : 'tests' }
CardTest >> test016WhenRepeatIsPlayedAndLastEffectWasNoEffectThenNothingHappens [
    | aShip aRepeat aGame aBoard |
    aShip := Ship named: 'Ship1'.
    aBoard := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    aGame := Game withShips: { aShip } dice: { LoadedDie with: 3 } board: aBoard laps: 2.
    aGame playTurn.
    aRepeat := Repeat new.
    aGame play: aRepeat from: aShip target: aShip.
    self assert: aShip position equals: 4.
]
