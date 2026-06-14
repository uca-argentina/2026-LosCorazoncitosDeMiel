Class {
	#name : 'Overload',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'applying' }
Overload >> applyTo: aRoll for: aShip [
	^ aRoll - 2
]
