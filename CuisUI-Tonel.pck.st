'From Cuis7.7 [latest update: #7777] on 18 April 2026 at 4:10:35 pm'!
'Description '!
!provides: 'CuisUI-Tonel' 1 3!
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

!TonelPackageExporter methodsFor: 'writing' stamp: 'GC 18/Apr/2026 15:08:26'!
write: aString toFile: aFileEntry

	aFileEntry forceWriteStreamDo: [:stream |
		stream nextPutAll: aString normalizedLineDelimiter]! !

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

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelClassDefinitionFor: aClass

	| metadataEntries methodDefinitions classComment |
	metadataEntries := self metadataEntriesForClass: aClass.
	methodDefinitions := self tonelMethodDefinitionsForClass: aClass.
	classComment := aClass comment.
	^ String streamContents: [:stream |
		(self shouldWriteComment: classComment) ifTrue: [
			stream nextPut: $"; nextPutAll: (self tonelComment: classComment); nextPut: $"; cr; cr].
		stream nextPutAll: TonelWriter classLabel; nextPutAll: ' {'; cr.
		self writeMetadataEntries: metadataEntries on: stream.
		stream nextPutAll: '}'.
		methodDefinitions ifNotEmpty: [
			stream cr; cr; nextPutAll: methodDefinitions ].
		stream cr]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelComment: aString

	^ aString copyReplaceAll: '"' with: '""'! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelExtensionDefinitionFor: aClass methods: methodReferences

	| sortedMethods |
	sortedMethods := methodReferences asSortedCollection: [:a :b |
		a selector = b selector
			ifTrue: [ a classIsMeta not and: [ b classIsMeta ] ]
			ifFalse: [ a selector asString < b selector asString ]].
	^ String streamContents: [:stream |
		stream
			nextPutAll: TonelWriter extensionLabel;
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

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:08:26'!
tonelPackageDefinitionFor: aPackage

	^ String streamContents: [:stream |
		stream
			nextPutAll: TonelWriter packageLabel;
			nextPutAll: ' {'; cr;
			nextPutAll: String tab; nextPutAll: '#name : '; nextPutAll: (self tonelString: aPackage packageName); cr;
			nextPutAll: '}'; cr]! !

!TonelPackageExporter methodsFor: 'tonel' stamp: 'GC 18/Apr/2026 15:54:29'!
tonelPackageDefinitionNamed: aName

	^ String streamContents: [:stream |
		stream
			nextPutAll: TonelWriter packageLabel;
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
