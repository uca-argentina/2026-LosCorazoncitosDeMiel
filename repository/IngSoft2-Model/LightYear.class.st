Class {
	#name : 'LightYear',
	#superclass : 'DistanceUnit',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
LightYear >> inParsecs [
	^ quantity / 3
]
