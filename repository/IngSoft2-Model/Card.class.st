Class {
	#name : 'Card',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
Card >> applyTo: aRoll for: aShip [
	^ aRoll + self delta
]

{ #category : 'accessing' }
Card >> delta [
	^ self subclassResponsibility
]
