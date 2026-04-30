Class {
	#name : 'DiceLoaded',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
DiceLoaded class >> with: value [

		value>0 ifTrue: [^ self new initializeWith: value] ifFalse:[Error signal: 'El valor del dado cargado debe ser mayor a 0']
]

{ #category : 'initialization' }
DiceLoaded >> initializeWith: anInterger [
	value:= anInterger.
]

{ #category : 'as yet unclassified' }
DiceLoaded >> roll [
	^value 
]
