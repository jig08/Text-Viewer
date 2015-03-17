as yet unclassified
run
	(instance == nil) ifTrue: [
		instance := Main new.
		^ instance.
	]; ifFalse: [
		^ instance.
	]