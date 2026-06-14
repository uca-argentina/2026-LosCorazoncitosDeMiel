Class {
	#name : 'UnitTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
UnitTest >> test001WhenAParsecIsCreatedWithFiveThenItsValueInParsecsIsFive [
	| aParsec |
	aParsec := Parsec of: 5.
	self assert: aParsec inParsecs equals: 5
]

{ #category : 'tests' }
UnitTest >> test002WhenALightYearIsCreatedWithThreeThenItsValueInParsecsIsOne [
	| aLightYear |
	aLightYear := LightYear of: 3.
	self assert: aLightYear inParsecs equals: 1
]
