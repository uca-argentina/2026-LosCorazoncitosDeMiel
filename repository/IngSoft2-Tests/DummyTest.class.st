Class {
	#name : 'DummyTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DummyTest >> testA [

	self assert: Dummy new isDummy
]

{ #category : 'tests' }
DummyTest >> testDummy [

	self assert: Dummy new isDummy
]
