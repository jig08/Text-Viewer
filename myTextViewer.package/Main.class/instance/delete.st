as yet unclassified
delete
	MyMenuItem clear.
	Chapter clear.
	txtViewer isNil ifFalse: [ txtViewer delete].
	ptm isNil ifFalse: [ ptm delete].
	mnuTitles isNil ifFalse: [ mnuTitles delete].
	box isNil ifFalse: [ box delete].
	box := nil.
	txtViewer := nil.
	mnuTitles := nil.
	ptm := nil.
	Smalltalk garbageCollect.