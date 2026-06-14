Class {
	#name : 'PermanentCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
PermanentCard >> applyTo: aRoll for: aShip [
	^ aRoll + self delta
]

{ #category : 'accessing' }
PermanentCard >> delta [
	^ self subclassResponsibility
]
