'From Cuis7.7 [latest update: #7777] on 22 April 2026 at 2:54:01 am'!
'Description '!
!provides: 'CuisUI-Tonel' 1 7!
SystemOrganization addCategory: #'CuisUI-Tonel'!


!classDefinition: #TonelPackageExporter category: #'CuisUI-Tonel'!
Object subclass: #TonelPackageExporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-Tonel'!
!classDefinition: 'TonelPackageExporter class' category: #'CuisUI-Tonel'!
TonelPackageExporter class
	instanceVariableNames: ''!

!classDefinition: #TonelPackageImporter category: #'CuisUI-Tonel'!
Object subclass: #TonelPackageImporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-Tonel'!
!classDefinition: 'TonelPackageImporter class' category: #'CuisUI-Tonel'!
TonelPackageImporter class
	instanceVariableNames: ''!


!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 16:10:03'!
categoriesFor: aName

	(self hasSystemCategoryNamed: aName) ifTrue: [ ^ Array with: aName ].
	^ self subcategoriesForRootNamed: aName! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 16:10:03'!
classesFor: aName

	| installedPackage classes |
	installedPackage := self installedPackageNamed: aName.
	classes := OrderedCollection new.
	installedPackage
		ifNotNil: [ installedPackage classesDo: [:each | classes add: each ] ]
		ifNil: [
			(self categoriesFor: aName) do: [:category |
				(SystemOrganization fullListAtCategoryNamed: category) do: [:each |
					classes add: (Smalltalk at: each) ] ] ].
	^ classes asSortedCollection: [:a :b | a name < b name]! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 16:10:03'!
exportNameFor: aName

	(self installedPackageNamed: aName) ifNotNil: [:package | ^ package packageName ].
	(self hasSystemCategoryNamed: aName) ifTrue: [ ^ aName ].
	(self hasRootCategoryNamed: aName) ifTrue: [ ^ aName ].
	self error: 'No existe el package ', aName! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 15:08:26'!
exportPackage: aPackage to: aDirectoryEntry

	| packageDirectory |
	packageDirectory := aDirectoryEntry / aPackage packageName.
	packageDirectory assureExistence.
	self writePackageDefinitionFor: aPackage on: packageDirectory.
	self writeClassDefinitionsFor: aPackage on: packageDirectory.
	self writeExtensionDefinitionsFor: aPackage on: packageDirectory.
	^ packageDirectory! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 15:54:29'!
exportPackageNamed: aPackageName to: aDirectoryEntry

	| exportName packageDirectory |
	exportName := self exportNameFor: aPackageName.
	packageDirectory := aDirectoryEntry / exportName.
	packageDirectory assureExistence.
	self writePackageDefinitionNamed: exportName on: packageDirectory.
	self writeClassDefinitionsNamed: aPackageName on: packageDirectory.
	self writeExtensionDefinitionsNamed: aPackageName on: packageDirectory.
	^ packageDirectory! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 15:54:29'!
extensionMethodsByClassFor: aName

	| installedPackage extensionsByClass |
	installedPackage := self installedPackageNamed: aName.
	extensionsByClass := Dictionary new.
	installedPackage ifNil: [ ^ extensionsByClass ].
	installedPackage extensionMethods do: [:each |
		| extendedClass |
		extendedClass := each methodClass theNonMetaClass.
		(extensionsByClass at: extendedClass ifAbsentPut: [ OrderedCollection new ]) add: each].
	^ extensionsByClass! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 16:10:03'!
hasRootCategoryNamed: aName

	^ (self subcategoriesForRootNamed: aName) notEmpty! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 15:54:29'!
hasSystemCategoryNamed: aName

	^ SystemOrganization categories includes: aName! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 15:54:29'!
installedPackageNamed: aName

	^ CodePackage installedPackages at: aName ifAbsent: [ nil ]! !

!TonelPackageExporter methodsFor: 'exporting' stamp: 'GC 18/Apr/2026 16:10:03'!
subcategoriesForRootNamed: aName

	^ (SystemOrganization categories
		select: [:each | (SystemOrganization rootCategoryOf: each) = aName]) asArray! !

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 22/Apr/2026 02:33:59'!
write: aString toFile: aFileEntry

	aFileEntry forceWriteStreamDo: [:stream |
		stream nextPutAll: aString ]! !

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 18/Apr/2026 15:09:11'!
writeClassDefinitionsFor: aPackage on: aDirectoryEntry

	| classes |
	classes := OrderedCollection new.
	aPackage classesDo: [:each | classes add: each].
	(classes asSortedCollection: [:a :b | a name < b name]) do: [:each |
		self
			write: (self tonelClassDefinitionFor: each)
			toFile: (aDirectoryEntry // (each name , '.class.st'))]! !

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 18/Apr/2026 15:54:29'!
writeClassDefinitionsNamed: aName on: aDirectoryEntry

	(self classesFor: aName) do: [:each |
		self
			write: (self tonelClassDefinitionFor: each)
			toFile: (aDirectoryEntry // (each name , '.class.st'))]! !

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 18/Apr/2026 15:09:11'!
writeExtensionDefinitionsFor: aPackage on: aDirectoryEntry

	| extensionsByClass |
	extensionsByClass := Dictionary new.
	aPackage extensionMethods do: [:each |
		| extendedClass |
		extendedClass := each methodClass theNonMetaClass.
		(extensionsByClass at: extendedClass ifAbsentPut: [ OrderedCollection new ]) add: each].
	(extensionsByClass keys asSortedCollection: [:a :b | a name < b name]) do: [:eachClass |
		self
			write: (self tonelExtensionDefinitionFor: eachClass methods: (extensionsByClass at: eachClass))
			toFile: (aDirectoryEntry // (eachClass name , '.extension.st'))]! !

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 18/Apr/2026 15:54:29'!
writeExtensionDefinitionsNamed: aName on: aDirectoryEntry

	| extensionsByClass |
	extensionsByClass := self extensionMethodsByClassFor: aName.
	(extensionsByClass keys asSortedCollection: [:a :b | a name < b name]) do: [:eachClass |
		self
			write: (self tonelExtensionDefinitionFor: eachClass methods: (extensionsByClass at: eachClass))
			toFile: (aDirectoryEntry // (eachClass name , '.extension.st'))]! !

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 18/Apr/2026 15:08:26'!
writePackageDefinitionFor: aPackage on: aDirectoryEntry

	self
		write: (self tonelPackageDefinitionFor: aPackage)
		toFile: (aDirectoryEntry // 'package.st')! !

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 18/Apr/2026 15:54:29'!
writePackageDefinitionNamed: aName on: aDirectoryEntry

	self
		write: (self tonelPackageDefinitionNamed: aName)
		toFile: (aDirectoryEntry // 'package.st')! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 22/Apr/2026 02:33:16'!
classLabel

	^ 'Class'! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 22/Apr/2026 02:33:16'!
extensionLabel

	^ 'Extension'! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
metadataEntriesForClass: aClass

	| entries type |
	entries := OrderedCollection new.
	entries add: '#name : ' , (self tonelString: aClass name).
	entries add: '#superclass : ' , (self tonelString: aClass superclass name).
	type := aClass typeOfClass.
	type = #normal ifFalse: [ entries add: '#type : ' , (self tonelString: type asString) ].
	aClass instVarNames isEmpty ifFalse: [ entries add: '#instVars : ' , (self tonelArray: aClass instVarNames) ].
	aClass classPool keys isEmpty ifFalse: [ entries add: '#classVars : ' , (self tonelArray: (aClass classPool keys collect: [:each | each asString])) ].
	aClass sharedPools isEmpty ifFalse: [ entries add: '#pools : ' , (self tonelArray: (aClass sharedPools collect: [:each | each name])) ].
	aClass class instVarNames isEmpty ifFalse: [ entries add: '#classInstVars : ' , (self tonelArray: aClass class instVarNames) ].
	entries add: '#category : ' , (self tonelString: aClass category).
	^ entries! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 22/Apr/2026 02:33:16'!
packageLabel

	^ 'Package'! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
shouldWriteComment: aString

	^ aString notNil and: [ aString notEmpty ]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelArray: aCollection

	^ String streamContents: [:stream |
		stream nextPutAll: '['.
		aCollection
			do: [:each | stream nextPutAll: (self tonelString: each asString)]
			separatedBy: [ stream nextPutAll: ', ' ].
		stream nextPutAll: ']']! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 22/Apr/2026 02:33:16'!
tonelClassDefinitionFor: aClass

	| metadataEntries methodDefinitions classComment |
	metadataEntries := self metadataEntriesForClass: aClass.
	methodDefinitions := self tonelMethodDefinitionsForClass: aClass.
	classComment := aClass comment.
	^ String streamContents: [:stream |
		(self shouldWriteComment: classComment) ifTrue: [
			stream nextPut: $"; nextPutAll: (self tonelComment: classComment); nextPut: $"; cr; cr].
		stream nextPutAll: self classLabel; nextPutAll: ' {'; cr.
		self writeMetadataEntries: metadataEntries on: stream.
		stream nextPutAll: '}'.
		methodDefinitions ifNotEmpty: [
			stream cr; cr; nextPutAll: methodDefinitions ].
		stream cr]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelComment: aString

	^ aString copyReplaceAll: '"' with: '""'! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 22/Apr/2026 02:33:16'!
tonelExtensionDefinitionFor: aClass methods: methodReferences

	| sortedMethods |
	sortedMethods := methodReferences asSortedCollection: [:a :b |
		a selector = b selector
			ifTrue: [ a classIsMeta not and: [ b classIsMeta ] ]
			ifFalse: [ a selector asString < b selector asString ]].
	^ String streamContents: [:stream |
		stream
			nextPutAll: self extensionLabel;
			nextPutAll: ' {'; cr;
			nextPutAll: String tab; nextPutAll: '#name : '; nextPutAll: (self tonelString: aClass name); cr;
			nextPutAll: '}'; cr; cr.
		sortedMethods
			do: [:each | stream nextPutAll: (self tonelMethodDefinitionForReference: each)]
			separatedBy: [ stream cr; cr ].
		stream cr]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:54'!
tonelMethodDefinitionForBehavior: aBehavior selector: aSelector

	| source sourceLines signature bodyLines category |
	source := aBehavior sourceCodeAt: aSelector.
	sourceLines := source lines.
	signature := sourceLines first.
	bodyLines := sourceLines allButFirst.
	category := (aBehavior >> aSelector) category.
	^ String streamContents: [:stream |
		stream nextPutAll: '{ #category : '.
		stream nextPutAll: (self tonelString: category).
		stream nextPutAll: ' }'.
		stream cr.
		stream nextPutAll: aBehavior theNonMetaClass name.
		aBehavior isMeta ifTrue: [ stream nextPutAll: ' class' ].
		stream nextPutAll: '>>'.
		stream nextPutAll: signature.
		stream nextPutAll: ' ['.
		stream cr.
		bodyLines do: [:line |
			stream nextPutAll: line.
			stream cr ].
		stream nextPutAll: ']' ]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelMethodDefinitionForReference: aMethodReference

	^ self
		tonelMethodDefinitionForBehavior: aMethodReference methodClass
		selector: aMethodReference selector! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelMethodDefinitionsForClass: aClass

	| definitions |
	definitions := OrderedCollection new.
	(aClass selectors asSortedCollection) do: [:selector |
		definitions add: (self tonelMethodDefinitionForBehavior: aClass selector: selector)].
	(aClass class selectors asSortedCollection) do: [:selector |
		definitions add: (self tonelMethodDefinitionForBehavior: aClass class selector: selector)].
	^ String streamContents: [:stream |
		definitions
			do: [:each | stream nextPutAll: each]
			separatedBy: [ stream cr; cr ]]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 22/Apr/2026 02:33:16'!
tonelPackageDefinitionFor: aPackage

	^ String streamContents: [:stream |
		stream
			nextPutAll: self packageLabel;
			nextPutAll: ' {'; cr;
			nextPutAll: String tab; nextPutAll: '#name : '; nextPutAll: (self tonelString: aPackage packageName); cr;
			nextPutAll: '}'; cr]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 22/Apr/2026 02:33:16'!
tonelPackageDefinitionNamed: aName

	^ String streamContents: [:stream |
		stream
			nextPutAll: self packageLabel;
			nextPutAll: ' {'; cr;
			nextPutAll: String tab; nextPutAll: '#name : '; nextPutAll: (self tonelString: aName); cr;
			nextPutAll: '}'; cr]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelString: aString

	^ '''' , (aString copyReplaceAll: '''' with: '''''') , ''''! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
writeMetadataEntries: metadataEntries on: aStream

	metadataEntries
		do: [:each | aStream nextPutAll: String tab; nextPutAll: each]
		separatedBy: [ aStream nextPutAll: ','; cr ]! !

!TonelPackageExporter class methodsFor: 'instance creation' stamp: 'GC 18/Apr/2026 15:08:26'!
exportPackageNamed: aPackageName to: aDirectoryEntry

	^ self new exportPackageNamed: aPackageName to: aDirectoryEntry! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
behaviorNamed: behaviorName classSide: aBoolean

	| behavior |
	behavior := Smalltalk at: behaviorName asSymbol.
	^ aBoolean
		ifTrue: [ behavior class ]
		ifFalse: [ behavior ]! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
canDefineClassFrom: aRecord

	^ Smalltalk includesKey: ((aRecord at: #metadata) at: #superclass) asSymbol! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
classFileEntriesIn: aDirectoryEntry

	^ (aDirectoryEntry files
		select: [:each | each name endsWith: '.class.st'])
		asSortedCollection: [:a :b | a name < b name]! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
classRecordFromFile: aFileEntry

	| source index comment metadataStart metadataEnd |
	source := aFileEntry fileContents.
	index := self skipSeparatorsIn: source startingAt: 1.
	comment := nil.
	(index <= source size and: [(source at: index) = $"]) ifTrue: [
		| parsed |
		parsed := self tonelCommentFrom: source startingAt: index.
		comment := parsed first.
		index := self skipSeparatorsIn: source startingAt: parsed second + 1 ].
	metadataStart := source indexOf: ${ startingAt: index.
	metadataEnd := self matchingBraceIn: source startingAt: metadataStart.
	^ Dictionary new
		at: #comment put: comment;
		at: #metadata put: (self metadataFromChunk: (source copyFrom: metadataStart + 1 to: metadataEnd - 1));
		at: #methods put: (self methodRecordsFrom: source startingAt: metadataEnd + 1);
		yourself! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
compileMethodRecord: aMethodRecord

	| behavior source |
	behavior := self behaviorNamed: (aMethodRecord at: #behaviorName) classSide: (aMethodRecord at: #classSide).
	source := (aMethodRecord at: #signature), (aMethodRecord at: #body).
	behavior compile: source classified: (aMethodRecord at: #category)! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
defineClassFromRecord: aRecord

	| metadata classObject |
	metadata := aRecord at: #metadata.
	classObject := self ensureClassFromMetadata: metadata.
	(aRecord at: #comment) ifNotNil: [:comment | classObject comment: comment ]! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:52:23'!
defineClassesFromRecords: classRecords

	| pending progress |
	pending := OrderedCollection withAll: classRecords.
	[pending notEmpty] whileTrue: [
		progress := false.
		pending copy do: [:each |
			(self canDefineClassFrom: each)
				ifTrue: [
					self defineClassFromRecord: each.
					pending remove: each.
					progress := true ]].
		progress ifFalse: [ self error: 'No pude resolver las dependencias entre clases Tonel.' ] ]! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:18'!
ensureClassFromMetadata: metadata

	| superclass classObject |
	superclass := Smalltalk at: (metadata at: #superclass) asSymbol.
	classObject := superclass
		perform: (self subclassCreationSelectorForType: (metadata at: #type ifAbsent: ['normal']) asSymbol)
		withArguments: {
			(metadata at: #name) asSymbol.
			self namesStringFrom: (metadata at: #instVars ifAbsent: [#()]).
			self namesStringFrom: (metadata at: #classVars ifAbsent: [#()]).
			self namesStringFrom: (metadata at: #pools ifAbsent: [#()]).
			metadata at: #category }.
	(metadata at: #classInstVars ifAbsent: [#()]) ifNotEmpty: [
		classObject class instanceVariableNames: (self namesStringFrom: (metadata at: #classInstVars)) ].
	^ classObject! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
extensionFileEntriesIn: aDirectoryEntry

	^ (aDirectoryEntry files
		select: [:each | each name endsWith: '.extension.st'])
		asSortedCollection: [:a :b | a name < b name]! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
extensionRecordFromFile: aFileEntry

	| source metadataStart metadataEnd |
	source := aFileEntry fileContents.
	metadataStart := source indexOf: ${ startingAt: 1.
	metadataEnd := self matchingBraceIn: source startingAt: metadataStart.
	^ Dictionary new
		at: #metadata put: (self metadataFromChunk: (source copyFrom: metadataStart + 1 to: metadataEnd - 1));
		at: #methods put: (self methodRecordsFrom: source startingAt: metadataEnd + 1);
		yourself! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
importMethodsFromRecord: aRecord

	(aRecord at: #methods) do: [:each |
		self compileMethodRecord: each ]! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
importPackageFrom: aDirectoryEntry

	| package classRecords |
	package := self registerPackageNamed: (self packageNameFrom: aDirectoryEntry).
	classRecords := (self classFileEntriesIn: aDirectoryEntry) collect: [:each | self classRecordFromFile: each].
	self defineClassesFromRecords: classRecords.
	classRecords do: [:each | self importMethodsFromRecord: each].
	(self extensionFileEntriesIn: aDirectoryEntry) do: [:each |
		self importMethodsFromRecord: (self extensionRecordFromFile: each)].
	package hasUnsavedChanges: false.
	^ package! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
packageNameFrom: aDirectoryEntry

	| metadata |
	metadata := self metadataFromChunk: (self packageMetadataChunkFrom: ((aDirectoryEntry // 'package.st') fileContents)).
	^ metadata at: #name! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
registerPackageNamed: packageName

	^ CodePackage named: packageName createIfAbsent: true registerIfNew: true! !

!TonelPackageImporter methodsFor: 'importing' stamp: 'GC 22/Apr/2026 02:47:02'!
subclassCreationSelectorForType: aSymbol

	aSymbol = #normal ifTrue: [ ^ #subclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	aSymbol = #variable ifTrue: [ ^ #variableSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	aSymbol = #weak ifTrue: [ ^ #weakSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	aSymbol = #ephemeron ifTrue: [ ^ #ephemeronSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	aSymbol = #immediate ifTrue: [ ^ #immediateSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	aSymbol = #longs ifTrue: [ ^ #variableDoubleWordSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	aSymbol = #words ifTrue: [ ^ #variableWordSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	aSymbol = #bytes ifTrue: [ ^ #variableByteSubclass:instanceVariableNames:classVariableNames:poolDictionaries:category: ].
	self error: 'Tipo de clase Tonel no soportado: ', aSymbol asString! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
chunkBoundsIn: source startingAt: startIndex open: openCharacter close: closeCharacter

	| depth index |
	depth := 0.
	index := startIndex.
	[index <= source size] whileTrue: [
		| character |
		character := source at: index.
		character = openCharacter ifTrue: [ depth := depth + 1 ].
		character = closeCharacter ifTrue: [
			depth := depth - 1.
			depth = 0 ifTrue: [ ^ Array with: startIndex with: index ] ].
		index := index + 1 ].
	self error: 'Chunk Tonel sin cierre.'! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
matchingBraceIn: source startingAt: startIndex

	^ (self chunkBoundsIn: source startingAt: startIndex open: ${ close: $}) second! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
metadataFromChunk: aString

	| metadata |
	metadata := Dictionary new.
	(aString lines collect: [:each | each withBlanksTrimmed])
		do: [:line |
			line isEmpty ifFalse: [
				| clean separator value |
				clean := line last = $,
					ifTrue: [ line allButLast ]
					ifFalse: [ line ].
				separator := clean findString: ' : ' startingAt: 1 caseSensitive: true.
				value := (clean copyFrom: separator + 3 to: clean size) withBlanksTrimmed.
				metadata
					at: (clean copyFrom: 2 to: separator - 1) asSymbol
					put: (self tonelValueFrom: value) ]].
	^ metadata! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:53:54'!
methodBodyBoundsIn: source startingAt: startIndex

	| depth index inString |
	depth := 1.
	index := startIndex + 1.
	inString := false.
	[index <= source size] whileTrue: [
		| character |
		character := source at: index.
		inString
			ifTrue: [
				character = $'
					ifTrue: [
						(index < source size and: [ (source at: index + 1) = $' ])
							ifTrue: [ index := index + 2 ]
							ifFalse: [
								inString := false.
								index := index + 1 ] ]
					ifFalse: [ index := index + 1 ] ]
			ifFalse: [
				character = $'
					ifTrue: [
						inString := true.
						index := index + 1 ]
					ifFalse: [
						character = $[ ifTrue: [ depth := depth + 1 ].
						character = $] ifTrue: [
							depth := depth - 1.
							depth = 0 ifTrue: [ ^ Array with: startIndex with: index ] ].
						index := index + 1 ] ] ].
	self error: 'Metodo Tonel sin cierre.'! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
methodRecordForHeader: header body: body category: category

	| separator behaviorToken signature classSide behaviorName |
	separator := header findString: '>>' startingAt: 1 caseSensitive: true.
	behaviorToken := (header copyFrom: 1 to: separator - 1) withBlanksTrimmed.
	classSide := behaviorToken endsWith: ' class'.
	behaviorName := classSide
		ifTrue: [ behaviorToken copyFrom: 1 to: behaviorToken size - 6 ]
		ifFalse: [ behaviorToken ].
	signature := (header copyFrom: separator + 2 to: header size) withBlanksTrimmed.
	^ Dictionary new
		at: #behaviorName put: behaviorName;
		at: #classSide put: classSide;
		at: #signature put: signature;
		at: #body put: body;
		at: #category put: category;
		yourself! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
methodRecordsFrom: source startingAt: startIndex

	| methods index |
	methods := OrderedCollection new.
	index := self skipSeparatorsIn: source startingAt: startIndex.
	[index <= source size] whileTrue: [
		| categoryBounds category headerStart bodyBounds header methodRecord |
		categoryBounds := self chunkBoundsIn: source startingAt: index open: ${ close: $}.
		category := (self metadataFromChunk: (source copyFrom: categoryBounds first + 1 to: categoryBounds second - 1)) at: #category.
		headerStart := self skipSeparatorsIn: source startingAt: categoryBounds second + 1.
		bodyBounds := self methodBodyBoundsIn: source startingAt: (source indexOf: $[ startingAt: headerStart).
		header := (source copyFrom: headerStart to: bodyBounds first - 1) withBlanksTrimmed.
		methodRecord := self methodRecordForHeader: header body: (source copyFrom: bodyBounds first + 1 to: bodyBounds second - 1) category: category.
		methods add: methodRecord.
		index := self skipSeparatorsIn: source startingAt: bodyBounds second + 1 ].
	^ methods! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
packageMetadataChunkFrom: source

	| metadataStart metadataEnd |
	metadataStart := source indexOf: ${ startingAt: 1.
	metadataEnd := self matchingBraceIn: source startingAt: metadataStart.
	^ source copyFrom: metadataStart + 1 to: metadataEnd - 1! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
quotedStringTokenFrom: source startingAt: startIndex

	| stream index |
	stream := WriteStream on: String new.
	index := startIndex.
	[index <= source size] whileTrue: [
		| character |
		character := source at: index.
		stream nextPut: character.
		(character = $' and: [ index > startIndex and: [ (source at: index - 1) ~= $' ]]) ifTrue: [
			(index < source size and: [ (source at: index + 1) = $' ])
				ifTrue: [
					stream nextPut: $'.
					index := index + 2 ]
				ifFalse: [ ^ Array with: stream contents with: index ] ]
		ifFalse: [ index := index + 1 ]].
	self error: 'String Tonel sin cierre.'! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
skipSeparatorsIn: source startingAt: startIndex

	| index |
	index := startIndex.
	[index <= source size and: [ (source at: index) isSeparator ]] whileTrue: [
		index := index + 1 ].
	^ index! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
tonelArrayValueFrom: aString

	| values index |
	values := OrderedCollection new.
	index := 2.
	[index <= aString size - 1] whileTrue: [
		index := self skipSeparatorsIn: aString startingAt: index.
		(index > aString size - 1 or: [ (aString at: index) = $] ]) ifTrue: [ ^ values asArray ].
		(values add: (self tonelStringValueFrom: (self quotedStringTokenFrom: aString startingAt: index) first)).
		index := (self quotedStringTokenFrom: aString startingAt: index) second + 1.
		[index <= aString size - 1 and: [ ((aString at: index) = $, or: [ (aString at: index) isSeparator ]) ]] whileTrue: [
			index := index + 1 ]].
	^ values asArray! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
tonelCommentFrom: source startingAt: startIndex

	| stream index |
	stream := WriteStream on: String new.
	index := startIndex + 1.
	[index <= source size] whileTrue: [
		| character |
		character := source at: index.
		(character = $" and: [ index < source size and: [ (source at: index + 1) = $" ]])
			ifTrue: [
				stream nextPut: $".
				index := index + 2 ]
			ifFalse: [
				character = $"
					ifTrue: [ ^ Array with: stream contents with: index ]
					ifFalse: [
						stream nextPut: character.
						index := index + 1 ] ]].
	self error: 'Comentario Tonel sin cierre.'! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
tonelStringValueFrom: aString

	| stream index |
	stream := WriteStream on: String new.
	index := 2.
	[index < aString size] whileTrue: [
		| character |
		character := aString at: index.
		(character = $' and: [ index < aString size - 1 and: [ (aString at: index + 1) = $' ]])
			ifTrue: [
				stream nextPut: $'.
				index := index + 2 ]
			ifFalse: [
				stream nextPut: character.
				index := index + 1 ]].
	^ stream contents! !

!TonelPackageImporter methodsFor: 'parsing' stamp: 'GC 22/Apr/2026 02:47:02'!
tonelValueFrom: aString

	| trimmed |
	trimmed := aString withBlanksTrimmed.
	trimmed isEmpty ifTrue: [ ^ '' ].
	trimmed first = $' ifTrue: [ ^ self tonelStringValueFrom: trimmed ].
	trimmed first = $[ ifTrue: [ ^ self tonelArrayValueFrom: trimmed ].
	^ trimmed! !

!TonelPackageImporter methodsFor: 'private' stamp: 'GC 22/Apr/2026 02:47:02'!
namesStringFrom: aCollection

	^ String streamContents: [:stream |
		aCollection
			do: [:each | stream nextPutAll: each]
			separatedBy: [ stream nextPut: Character space ]]! !

!TonelPackageImporter class methodsFor: 'instance creation' stamp: 'GC 22/Apr/2026 02:47:02'!
importPackageFrom: aDirectoryEntry

	^ self new importPackageFrom: aDirectoryEntry! !
