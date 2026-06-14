Class {
	#name : 'EffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectTest >> test001WhenShipLandsOnNoEffectSquareThenPositionDoesNotChange [
    | ship effect |
    ship := Ship named: 'Ship1'.
    effect := NoEffect new.
    effect applyTo: ship on: nil.
    self assert: ship position equals: 1.
]

{ #category : 'tests' }
EffectTest >> test002WhenShipLandsOnSpeedUpThenPositionAdvances4 [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := SpeedUp new.
    effect applyTo: ship on: game.
    self assert: ship position equals: 5.
]

{ #category : 'tests' }
EffectTest >> test003WhenShipLandsOnWormHoleThenPositionGoesBack4 [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    ship moveTo: 6.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := WormHole new.
    effect applyTo: ship on: game.
    self assert: ship position equals: 2.
]

{ #category : 'tests' }
EffectTest >> test004WhenShipLandsOnMoonWalkThenOtherShipsGoBackN [
    | ship1 ship2 effect game dice board |
    ship1 := Ship named: 'Ship1'.
    ship2 := Ship named: 'Ship2'.
    ship2 moveTo: 5.
    dice := LoadedDie with: 3.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship1. ship2} dice: {dice} board: board laps: 2.
    effect := MoonWalk withSteps: 3.
    effect applyTo: ship1 on: game.
    self assert: ship2 position equals: 2.
]

{ #category : 'tests' }
EffectTest >> test006WhenShipLandsOnAtomicBombThenAllShipsGoToPosition1 [
    | ship1 ship2 effect game dice board |
    ship1 := Ship named: 'Ship1'.
    ship2 := Ship named: 'Ship2'.
    ship1 moveTo: 5.
    ship2 moveTo: 8.
    dice := LoadedDie with: 3.
    board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new) .
    game := Game withShips: {ship1. ship2} dice: {dice} board: board laps: 2.
    effect := AtomicBomb new.
    effect applyTo: ship1 on: game.
    self assert: ship1 position equals: 1.
    self assert: ship2 position equals: 1.
]

{ #category : 'tests' }
EffectTest >> test007WhenShipLandsOnHyperJumpThenShipAdvancesByFirstParsec [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := HyperJump withParsecs: {10. 5. 2}.
    effect applyTo: ship on: game.
    self assert: ship position equals: 2.
]

{ #category : 'tests' }
EffectTest >> test008WhenShipLandsOnHyperJumpThenShipAdvancesByParsecs [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := HyperJump withParsecs: {20. 10. 5}.
    effect applyTo: ship on: game.
    self assert: ship position equals: 3.
]

{ #category : 'running' }
EffectTest >> test009WhenShipLandsOnSpeedUpNearEndOfBoardThenPositionWraps [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    ship moveTo: 8.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := SpeedUp new.
    effect applyTo: ship on: game.
    self assert: ship position equals: 2.
]

{ #category : 'running' }
EffectTest >> test010WhenShipLandsOnWormHoleAt2ThenPositionWrapsToEnd [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    ship moveTo: 2.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := WormHole new.
    effect applyTo: ship on: game.
    self assert: ship position equals: 8.
]

{ #category : 'running' }
EffectTest >> test011WhenShipIsMovedByMoonWalkBeyondStartThenPositionWraps [
    | ship1 ship2 effect game dice board |
    ship1 := Ship named: 'Ship1'.
    ship2 := Ship named: 'Ship2'.
    ship2 moveTo: 2.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship1. ship2} dice: {dice} board: board laps: 2.
    effect := MoonWalk withSteps: 3.
    effect applyTo: ship1 on: game.
    self assert: ship2 position equals: 9.
]

{ #category : 'running' }
EffectTest >> test012WhenShipLandsOnHyperJumpNearEndOfBoardThenPositionWraps [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    ship moveTo: 8.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := HyperJump withParsecs: {50. 20. 10}.
    effect applyTo: ship on: game.
    self assert: ship position equals: 3.
]

{ #category : 'running' }
EffectTest >> test013WhenShipLandsOnHyperJumpAndCrossesGoalThenLapIsAdded [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    ship moveTo: 8.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 2.
    effect := HyperJump withParsecs: {50. 20. 10}.
    effect applyTo: ship on: game.
    self assert: ship laps equals: 1.
]

{ #category : 'running' }
EffectTest >> test014WhenHyperJumpIsAppliedFourTimesThenParsecsCycleFromHighestToLowestAndReset [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 1.
    board := Board with: 20 parsecs: 100 effects: (Array new: 20 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 5.
    effect := HyperJump withParsecs: {20. 10. 5}.

    effect applyTo: ship on: game.
    self assert: ship position equals: 5.

    effect applyTo: ship on: game.
    self assert: ship position equals: 7.

    effect applyTo: ship on: game.
    self assert: ship position equals: 8.

    effect applyTo: ship on: game.
    self assert: ship position equals: 12.
]

{ #category : 'tests' }
EffectTest >> test015WhenHyperJumpReceivesUnorderedParsecsThenAppliesThemFromHighestToLowest [
    | ship effect game dice board |
    ship := Ship named: 'Ship1'.
    dice := LoadedDie with: 1.
    board := Board with: 20 parsecs: 100 effects: (Array new: 20 withAll: NoEffect new).
    game := Game withShips: {ship} dice: {dice} board: board laps: 5.
    effect := HyperJump withParsecs: {5. 20. 10}.

    effect applyTo: ship on: game.
    self assert: ship position equals: 5.

    effect applyTo: ship on: game.
    self assert: ship position equals: 7.

    effect applyTo: ship on: game.
    self assert: ship position equals: 8.
]

{ #category : 'tests' }
EffectTest >> test016WhenAtomicBombIsAppliedThenAllShipsKeepTheirLaps [
    | ship1 ship2 effect game dice board |
    ship1 := Ship named: 'Ship1'.
    ship2 := Ship named: 'Ship2'.
    ship1 moveTo: 5.
    ship2 moveTo: 8.
    ship1 addLap.
    ship1 addLap.
    ship2 addLap.
    dice := LoadedDie with: 1.
    board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
    game := Game withShips: {ship1. ship2} dice: {dice} board: board laps: 5.
    effect := AtomicBomb new.
    
    effect applyTo: ship1 on: game.
    
    self assert: ship1 position equals: 1.
    self assert: ship2 position equals: 1.
    self assert: ship1 laps equals: 2.
    self assert: ship2 laps equals: 1.
]

{ #category : 'tests' }
EffectTest >> test017WhenShipLandsOnGivesCardThenShipReceivesOneCard [
	| ship effect game dice board |
	ship := Ship named: 'Ship1'.
	dice := LoadedDie with: 1.
	board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
	game := Game withShips: {ship} dice: {dice} board: board laps: 2.
	effect := GivesCard new.
	effect applyTo: ship on: game.
	self assert: ship hand size equals: 1
]

{ #category : 'tests' }
EffectTest >> test018WhenShipLandsOnGivesCardTwiceThenItReceivesTwoCards [
	| ship effect game dice board |
	ship := Ship named: 'Ship1'.
	dice := LoadedDie with: 1.
	board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
	game := Game withShips: {ship} dice: {dice} board: board laps: 2.
	effect := GivesCard new.
	effect applyTo: ship on: game.
	effect applyTo: ship on: game.
	self assert: ship hand size equals: 2
]

{ #category : 'tests' }
EffectTest >> test019WhenShipWithCardsLandsOnGivesCardThenItGetsOneMoreCard [
	| ship effect game dice board |
	ship := Ship named: 'Ship1'.
	ship receive: Overload new.
	ship receive: Overload new.
	dice := LoadedDie with: 1.
	board := Board with: 10 parsecs: 100 effects: (Array new: 10 withAll: NoEffect new).
	game := Game withShips: {ship} dice: {dice} board: board laps: 2.
	effect := GivesCard new.
	effect applyTo: ship on: game.
	self assert: ship hand size equals: 3
]

{ #category : 'tests' }
EffectTest >> test020WhenHyperJumpReceivesMixedDistanceUnitsThenItUsesTheLargestInParsecs [
	| ship hyperJump game dice board |
	ship := Ship named: 'Ship1'.
	dice := LoadedDie with: 1.
	board := Board with: 10 parsecs: 10 effects: (Array new: 10 withAll: NoEffect new).
	game := Game withShips: {ship} dice: {dice} board: board laps: 2.
	hyperJump := HyperJump withParsecs: { Parsec of: 3. LightYear of: 6 }.
	hyperJump applyTo: ship on: game.
	self assert: ship position equals: 4
]

{ #category : 'tests' }
EffectTest >> test021WhenHyperJumpReceivesOnlyLightYearsThenItWorksCorrectly [
	| ship hyperJump game dice board |
	ship := Ship named: 'Ship1'.
	dice := LoadedDie with: 1.
	board := Board with: 10 parsecs: 10 effects: (Array new: 10 withAll: NoEffect new).
	game := Game withShips: {ship} dice: {dice} board: board laps: 2.
	hyperJump := HyperJump withParsecs: { LightYear of: 9. LightYear of: 6 }.
	hyperJump applyTo: ship on: game.
	self assert: ship position equals: 4
]
