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
EffectTest >> test005WhenShipLandsOnMoonWalkThenOtherShipsGoBackN [
    | ship1 ship2 effect game dice board |
    ship1 := Ship named: 'Ship1'.
    ship2 := Ship named: 'Ship2'.
    ship2 moveTo: 5.
    dice := LoadedDie with: 3.
    board := Board with: 10 parsecs:100 effects: (Array new: 10 withAll: NoEffect new).
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
