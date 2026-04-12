'From Cuis7.7 [latest update: #7777] on 11 April 2026 at 11:12:23 pm'!
'Description '!
!provides: 'CuisUI-IDE-Browser' 1 28!
!requires: 'CuisUI-IDE-Core' 1 0 nil!
SystemOrganization addCategory: #'CuisUI-IDE-Browser'!


!classDefinition: #IdeBrowserSampleClass category: #'CuisUI-IDE-Browser'!
Object subclass: #IdeBrowserSampleClass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Browser'!
!classDefinition: 'IdeBrowserSampleClass class' category: #'CuisUI-IDE-Browser'!
IdeBrowserSampleClass class
	instanceVariableNames: ''!

!classDefinition: #IdeBrowserModel category: #'CuisUI-IDE-Browser'!
CodeProvider subclass: #IdeBrowserModel
	instanceVariableNames: 'browser selectedPackageName packageListIndex selectedClassName classListIndex selectedProtocolName selectedMethodSelector selectedMethodTreeItem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Browser'!
!classDefinition: 'IdeBrowserModel class' category: #'CuisUI-IDE-Browser'!
IdeBrowserModel class
	instanceVariableNames: ''!

!classDefinition: #IdeBrowserWindow category: #'CuisUI-IDE-Browser'!
IdeNavigationWindow subclass: #IdeBrowserWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Browser'!
!classDefinition: 'IdeBrowserWindow class' category: #'CuisUI-IDE-Browser'!
IdeBrowserWindow class
	instanceVariableNames: ''!

!classDefinition: #IdeMethodWrapper category: #'CuisUI-IDE-Browser'!
ListItemWrapper subclass: #IdeMethodWrapper
	instanceVariableNames: 'protocolName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Browser'!
!classDefinition: 'IdeMethodWrapper class' category: #'CuisUI-IDE-Browser'!
IdeMethodWrapper class
	instanceVariableNames: ''!

!classDefinition: #IdeProtocolWrapper category: #'CuisUI-IDE-Browser'!
ListItemWrapper subclass: #IdeProtocolWrapper
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Browser'!
!classDefinition: 'IdeProtocolWrapper class' category: #'CuisUI-IDE-Browser'!
IdeProtocolWrapper class
	instanceVariableNames: ''!


!IdeBrowserSampleClass methodsFor: 'alpha' stamp: 'GC 11/Apr/2026 22:30:10'!
alphaOne
	^ 'alpha-one'! !

!IdeBrowserSampleClass methodsFor: 'alpha' stamp: 'GC 4/Apr/2026 03:54:52'!
alphaTwo
	^ 'alpha-two'! !

!IdeBrowserSampleClass methodsFor: 'beta' stamp: 'GC 4/Apr/2026 03:54:52'!
betaOne
	^ 'beta-one'! !

!IdeBrowserSampleClass class methodsFor: 'alpha' stamp: 'GC 11/Apr/2026 23:05:11'!
classAlpha
	^ 'class-alpha'! !

!IdeBrowserModel methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 22:43:08'!
initialize

	super initialize.
	browser := Browser new.
	browser listClassesHierarchically: true.
	packageListIndex := 0.
	classListIndex := 0.	
	selectedMethodTreeItem := nil.
	self packageList isEmpty ifFalse: [ self packageListIndex: 1 ]! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 18:58:55'!
packageList

	^ (SystemOrganization categories collect: [:each | each asString]) asSortedCollection asArray! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 03:55:59'!
packageListIndex
	^ packageListIndex! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 19:03:38'!
packageListIndex: anInteger

	| packages selectedName |
	packages := self packageList.
	packageListIndex := (packages isInBounds: anInteger) ifTrue: [ anInteger ] ifFalse: [ 0 ].
	selectedName := packageListIndex = 0 ifTrue: [ nil ] ifFalse: [ packages at: packageListIndex ].
	self selectPackageNamed: selectedName index: packageListIndex! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 19:03:38'!
packageRoots

	| categories subcategories roots name |
	categories := self systemCategoryList.
	subcategories := Dictionary new.
	categories do: [:each |
		name := SystemOrganization rootCategoryOf: each.
		(subcategories at: name ifAbsentPut: [ OrderedCollection new ]) add: each].
	roots := OrderedCollection new.
	categories do: [:each |
		name := SystemOrganization rootCategoryOf: each.
		(roots includes: name) ifFalse: [
			((subcategories at: name) size > 1)
				ifTrue: [ roots add: name ]
				ifFalse: [ roots add: (subcategories at: name) first ] ]].
	^ roots collect: [:each | SystemCategoryWrapper with: each name: each asString model: self]! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 19:03:38'!
selectPackageNamed: aString

	self
		selectPackageNamed: aString
		index: ((self packageList indexOf: aString) ifNil: [ 0 ])! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 22:43:08'!
selectPackageNamed: aString index: anInteger

	browser setSelectedSystemCategory: aString.
	self synchronizeFromBrowser.
	selectedMethodTreeItem := nil.
	self changed: #selectedPackageName.
	self changed: #packageListIndex.
	self changed: #classList.
	self changed: #classListIndex.
	self changed: #methodRoots.
	self changed: #selectedMethodTreeItem.
	self acceptedContentsChanged! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 19:08:53'!
setSelectedPackageTreeItem: aSystemCategoryWrapper

	aSystemCategoryWrapper ifNotNil: [
		self
			selectPackageNamed: aSystemCategoryWrapper withoutListWrapper
			index: ((self packageList indexOf: aSystemCategoryWrapper withoutListWrapper) ifNil: [ 0 ]) ]! !

!IdeBrowserModel methodsFor: 'package list' stamp: 'GC 4/Apr/2026 19:03:38'!
systemCategoryList

	^ self packageList! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
basicClassList

	selectedPackageName ifNil: [ ^ #() ].
	^ (SystemOrganization fullListAtCategoryNamed: selectedPackageName) asSortedCollection asArray! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
classList

	^ self hierarchicalClassList! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 03:55:59'!
classListIndex
	^ classListIndex! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 22:43:50'!
classListIndex: anInteger

	| classes |
	classes := self classList.
	classListIndex := (classes isInBounds: anInteger) ifTrue: [ anInteger ] ifFalse: [ 0 ].
	selectedClassName := classListIndex = 0
		ifTrue: [ nil ]
		ifFalse: [ (classes at: classListIndex) withoutLeadingBlanks ].
	selectedProtocolName := nil.
	selectedMethodSelector := nil.
	selectedMethodTreeItem := nil.
	selectedClassName
		ifNil: [ browser classListIndex: 0 ]
		ifNotNil: [ browser selectClass: (Smalltalk at: selectedClassName asSymbol) ].
	self synchronizeFromBrowser.
	self changed: #classListIndex.
	self changed: #methodRoots.
	self changed: #selectedMethodTreeItem.
	self acceptedContentsChanged! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
createHierarchyTreeOf: classes

	^ self
		createHierarchyTreeOf: classes
		comparingWith: [:potentialSuperClass :potentialSubClass |
			potentialSuperClass = potentialSubClass superclass ]! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
createHierarchyTreeOf: classes comparingWith: aBlockForComparingClasses
	"Create a tree from a collection of classes while preserving order."

	| classesWithSubclassIndexes |
	classesWithSubclassIndexes := classes collect: [:eachClass |
		| subclasses subclassIndexes |
		subclasses := classes select: [:each |
			aBlockForComparingClasses value: eachClass value: each].
		subclassIndexes := subclasses collect: [:child | classes indexOf: child].
		Association key: eachClass value: subclassIndexes ].
	classesWithSubclassIndexes copy do: [:classAndSubclassIndexes |
		classAndSubclassIndexes value: (classAndSubclassIndexes value collect: [:index |
			| subclassAssociation |
			subclassAssociation := classesWithSubclassIndexes at: index.
			classesWithSubclassIndexes at: index put: nil.
			subclassAssociation ])].
	^ classesWithSubclassIndexes select: [:each | each notNil ]! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
flattenHierarchyTree: classHierarchy on: aCollection indent: anIndent

	^ self
		flattenHierarchyTree: classHierarchy
		on: aCollection
		indent: anIndent
		by: '  '! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
flattenHierarchyTree: classHierarchy on: aCollection indent: anIndent by: indentChars

	| plusIndent |
	plusIndent := indentChars.
	classHierarchy do: [:association |
		| class children |
		class := association key.
		aCollection add: anIndent , class name.
		children := association value.
		self
			flattenHierarchyTree: children
			on: aCollection
			indent: anIndent , plusIndent
			by: indentChars ].
	^ aCollection! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
hierarchicalClassList
	"Reorder the classes in the selected category so they are shown indented by inheritance."

	| classes |
	classes := self basicClassList collect: [:each | Smalltalk classNamed: each].
	^ self
		flattenHierarchyTree: (self createHierarchyTreeOf: classes)
		on: OrderedCollection new
		indent: ''! !

!IdeBrowserModel methodsFor: 'class list' stamp: 'GC 4/Apr/2026 19:54:35'!
selectClassNamed: aString
	| index |
	index := self classList findFirst: [:each | each withoutLeadingBlanks = aString].
	self classListIndex: index! !

!IdeBrowserModel methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 22:43:08'!
browser

	^ browser! !

!IdeBrowserModel methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:55:59'!
selectedClass
	^ selectedClassName ifNotNil: [ Smalltalk at: selectedClassName asSymbol ifAbsent: [ nil ] ]! !

!IdeBrowserModel methodsFor: 'accessing' stamp: 'GC 11/Apr/2026 17:32:27'!
selectedClassOrMetaClass

	| baseClass |
	baseClass := self selectedClass.
	baseClass ifNil: [ ^ nil ].
	(browser metaClassIndicated and: [ baseClass notNil ])
		ifTrue: [ ^ baseClass class ].
	^ baseClass! !

!IdeBrowserModel methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:55:59'!
selectedMessageName
	^ selectedMethodSelector! !

!IdeBrowserModel methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 19:03:38'!
selectedPackageName

	^ selectedPackageName! !

!IdeBrowserModel methodsFor: 'accessing' stamp: 'GC 11/Apr/2026 23:01:24'!
selectedProtocolName

	^ selectedProtocolName! !

!IdeBrowserModel methodsFor: 'method list' stamp: 'GC 11/Apr/2026 17:32:36'!
methodRoots

	| behavior |
	behavior := self selectedClassOrMetaClass.
	behavior ifNil: [ ^ #() ].
	^ (behavior methodCategories asSortedCollection collect: [:each |
		IdeProtocolWrapper with: each model: self ]) asArray! !

!IdeBrowserModel methodsFor: 'method list' stamp: 'GC 11/Apr/2026 17:32:36'!
methodWrappersForProtocol: aProtocolName

	| behavior |
	behavior := self selectedClassOrMetaClass.
	behavior ifNil: [ ^ #() ].
	^ ((behavior selectorsInCategory: aProtocolName) asSortedCollection collect: [:each |
		IdeMethodWrapper selector: each protocol: aProtocolName model: self ]) asArray! !

!IdeBrowserModel methodsFor: 'method list' stamp: 'GC 4/Apr/2026 03:55:59'!
selectedMethodTreeItem
	^ selectedMethodTreeItem! !

!IdeBrowserModel methodsFor: 'method list' stamp: 'GC 4/Apr/2026 22:43:08'!
selectedMethodTreeItem: aWrapper

	selectedMethodTreeItem := aWrapper.
	aWrapper ifNil: [
		browser messageCategoryListIndex: 0.
		self synchronizeFromBrowser.
		self changed: #selectedMethodTreeItem.
		^ self acceptedContentsChanged ].
	(aWrapper isKindOf: IdeMethodWrapper)
		ifTrue: [
			browser setClass: self selectedClass selector: aWrapper item.
			selectedProtocolName := aWrapper protocolName ]
		ifFalse: [
			browser messageCategoryListIndex: (browser messageCategoryList indexOf: aWrapper item).
			selectedProtocolName := aWrapper item ].
	self synchronizeFromBrowser.
	self changed: #selectedMethodTreeItem.
	self acceptedContentsChanged! !

!IdeBrowserModel methodsFor: 'contents' stamp: 'GC 4/Apr/2026 20:45:08'!
acceptClassDefinition: input notifying: aRequestor

	| definedClass |
	[
		definedClass := Compiler
			evaluate: input string
			notifying: aRequestor
			logged: true
	] on: RecompilationFailure do: [ :ex |
		^ false ].
	(definedClass isKindOf: Behavior) ifFalse: [ ^ false ].
	self selectPackageNamed: definedClass category.
	self selectClassNamed: definedClass theNonMetaClass name.
	^ true! !

!IdeBrowserModel methodsFor: 'contents' stamp: 'GC 4/Apr/2026 22:43:08'!
acceptedStringOrText

	^ browser acceptedStringOrText! !

!IdeBrowserModel methodsFor: 'contents' stamp: 'GC 4/Apr/2026 22:43:08'!
contents: input notifying: aRequestor

	| accepted |
	accepted := browser contents: input notifying: aRequestor.
	accepted ifFalse: [ ^ false ].
	self synchronizeFromBrowser.
	self changed: #methodRoots.
	self changed: #selectedMethodTreeItem.
	self acceptedContentsChanged.
	^ true! !

!IdeBrowserModel methodsFor: 'testing' stamp: 'GC 11/Apr/2026 23:04:29'!
isEditingExistingClass

	self selectedClass ifNil: [ ^ false ].
	self selectedMessageName ifNotNil: [ ^ false ].
	self selectedProtocolName ifNotNil: [ ^ false ].
	^ true! !

!IdeBrowserModel methodsFor: 'testing' stamp: 'GC 4/Apr/2026 03:55:59'!
isEditingMethod
	^ self selectedMessageName notNil! !

!IdeBrowserModel methodsFor: 'quick actions' stamp: 'GC 4/Apr/2026 03:58:45'!
quickActionContext
	^ IdeQuickActionContext new
		selectedClass: self selectedClass;
		selectedSelector: self selectedMessageName;
		yourself! !

!IdeBrowserModel methodsFor: 'user interface support' stamp: 'GC 4/Apr/2026 22:43:08'!
editorClassFor: textGetter

	textGetter = #acceptedContents ifTrue: [ ^ SmalltalkEditor ].
	^ super editorClassFor: textGetter! !

!IdeBrowserModel methodsFor: 'shout styling' stamp: 'GC 4/Apr/2026 20:45:08'!
aboutToStyleWith: anSHTextStyler

	"Nil for class definitions so Shout parses the class declaration instead of a method body."

	anSHTextStyler classOrMetaClass: self stylingClassContext! !

!IdeBrowserModel methodsFor: 'shout styling' stamp: 'GC 4/Apr/2026 20:45:08'!
stylingClassContext

	^ self isEditingExistingClass
		ifTrue: [ nil ]
		ifFalse: [ self selectedClassOrMetaClass ]! !

!IdeBrowserModel methodsFor: 'private' stamp: 'GC 11/Apr/2026 22:03:33'!
refreshMethodTreeSelection

	selectedMethodTreeItem := self wrapperForSelectedMethod.
	^ selectedMethodTreeItem! !

!IdeBrowserModel methodsFor: 'private' stamp: 'GC 4/Apr/2026 22:43:08'!
synchronizeFromBrowser

	selectedPackageName := browser selectedSystemCategory.
	packageListIndex := selectedPackageName
		ifNil: [ 0 ]
		ifNotNil: [ (self packageList indexOf: selectedPackageName) ifNil: [ 0 ] ].
	selectedClassName := browser selectedClass ifNotNil: [:each | each name].
	classListIndex := browser classListIndex.
	selectedProtocolName := browser selectedMessageCategoryName.
	selectedMethodSelector := browser selectedMessageName! !

!IdeBrowserModel methodsFor: 'private' stamp: 'GC 11/Apr/2026 22:03:33'!
wrapperForSelectedMethod

	| selector behavior protocol roots protocolWrapper |
	selector := selectedMethodSelector.
	selector ifNil: [ ^ nil ].
	behavior := self selectedClassOrMetaClass.
	behavior ifNil: [ ^ nil ].
	protocol := selectedProtocolName
		ifNil: [ behavior organization
			categoryOfElement: selector
			ifAbsent: [ nil ] ].
	roots := self methodRoots.
	protocolWrapper := protocol
		ifNil: [ roots detect: [:each |
			(each contents anySatisfy: [:method | method item = selector ]) ]
			ifNone: [ nil ] ]
		ifNotNil: [ roots detect: [:each | each item = protocol ] ifNone: [ nil ] ].
	protocolWrapper ifNil: [ ^ nil ].
	^ protocolWrapper contents
		detect: [:methodWrapper | methodWrapper item = selector ]
		ifNone: [ nil ]! !

!IdeBrowserModel methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 22:03:33'!
focusOnBehavior: aBehavior selector: aSelector

	aBehavior ifNil: [ ^ self ].
	browser setClass: aBehavior selector: aSelector.
	self synchronizeFromBrowser.
	self refreshMethodTreeSelection.
	self changed: #selectedPackageName.
	self changed: #packageListIndex.
	self changed: #classList.
	self changed: #classListIndex.
	self changed: #methodRoots.
	self changed: #selectedMethodTreeItem.
	self acceptedContentsChanged! !

!IdeBrowserModel methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 17:32:43'!
goToDefinition

	(selectedMethodTreeItem isKindOf: IdeMethodWrapper)
		ifTrue: [ ^ self goToDefinitionFromMethod: selectedMethodTreeItem ].
	^ self goToDefinitionFromSelectedClass! !

!IdeBrowserModel methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 17:32:43'!
goToDefinitionFromMethod: aMethodWrapper

	| selector |
	aMethodWrapper ifNil: [ ^ self goToDefinitionFromSelectedClass ].
	selector := aMethodWrapper item.
	selector ifNil: [ ^ self goToDefinitionFromSelectedClass ].
	IdeBrowserWindow openImplementorSelectionFor: selector! !

!IdeBrowserModel methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 17:32:43'!
goToDefinitionFromSelectedClass

	| behavior |
	behavior := self selectedClassOrMetaClass.
	behavior ifNil: [ ^ self ].
	IdeBrowserWindow openOnClass: behavior selector: nil! !

!IdeBrowserWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 04:00:25'!
buildClassList
	^ (PluggableListMorph
		withModel: model
		listGetter: #classList
		indexGetter: #classListIndex
		indexSetter: #classListIndex:)
		menuNshortcutsKey: #classListMenuSpec! !

!IdeBrowserWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 04:00:25'!
buildMethodTree
	^ (HierarchicalListMorph
		withModel: model
		listGetter: #methodRoots
		indexGetter: #selectedMethodTreeItem
		indexSetter: #selectedMethodTreeItem:)
		autoDeselect: true;
		autoExpand: true;
		yourself! !

!IdeBrowserWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 19:03:38'!
buildPackageList

	^ (HierarchicalListMorph
		withModel: model
		listGetter: #packageRoots
		indexGetter: #selectedPackageName
		indexSetter: #setSelectedPackageTreeItem:)
		menuNshortcutsKey: #classListMenuSpec;
		autoDeselect: true;
		autoExpand: true;
		yourself! !

!IdeBrowserWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 16:46:51'!
navigationColumnMorphsWithProportions
	^ {
		{ self buildPackageList. 0.2 }.
		{ self buildClassList. 0.4 }.
		{ self buildMethodTree. 0.4 } }! !

!IdeBrowserWindow methodsFor: 'GUI building' stamp: 'GC 11/Apr/2026 23:12:08'!
windowLabel

	| behaviorName methodName protocolName |
	model ifNil: [ ^ 'IDE Browser' ].
	behaviorName := model selectedClassOrMetaClass
		ifNotNil: [ :behavior | behavior name asString ].
	(model isEditingExistingClass)
		ifTrue: [
			behaviorName ifNil: [ ^ 'Class definition' ].
			^ 'Class definition - ', behaviorName ].
	methodName := model selectedMessageName.
	methodName ifNotNil: [
		behaviorName ifNil: [ ^ methodName printString ].
		^ behaviorName , '>>', methodName printString ].
	behaviorName ifNil: [ ^ 'IDE Browser' ].
	protocolName := model selectedProtocolName.
	protocolName ifNotNil: [ ^ behaviorName , ' - ', protocolName ].
	^ behaviorName! !

!IdeBrowserWindow methodsFor: 'updating' stamp: 'GC 4/Apr/2026 05:10:05'!
methodSelectionChanged
	| inner |
	self codePaneMorph textPane enableEditing.
	model selectedMessageName ifNil: [ ^ self ].
	inner := self codePaneMorph textPane innerTextMorph.
	inner startBlinking.
	self focusCodePaneIfPossible! !

!IdeBrowserWindow methodsFor: 'updating' stamp: 'GC 11/Apr/2026 22:52:40'!
update: anEvent

	super update: anEvent.
	anEvent = #selectedMethodTreeItem ifTrue: [ self methodSelectionChanged ].
	(#(selectedMethodTreeItem classListIndex selectedPackageName packageListIndex) includes: anEvent)
		ifTrue: [ self setLabel: self windowLabel ]! !

!IdeBrowserWindow methodsFor: 'menu commands' stamp: 'GC 11/Apr/2026 17:32:46'!
browseMethodFull

	^ self goToDefinition! !

!IdeBrowserWindow methodsFor: 'menu commands' stamp: 'GC 11/Apr/2026 17:32:46'!
goToDefinition

	^ model goToDefinition! !

!IdeBrowserWindow class methodsFor: 'instance creation' stamp: 'GC 11/Apr/2026 17:32:53'!
onClass: aBehavior selector: aSelector

	| browserModel |
	browserModel := IdeBrowserModel new.
	aBehavior ifNotNil: [ browserModel focusOnBehavior: aBehavior selector: aSelector ].
	^ self on: browserModel! !

!IdeBrowserWindow class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 22:57:23'!
open

	| window |
	window := self on: IdeBrowserModel new.
	window openInWorld.
	^ window! !

!IdeBrowserWindow class methodsFor: 'instance creation' stamp: 'GC 11/Apr/2026 17:32:53'!
openOnClass: aBehavior selector: aSelector

	| window |
	window := self onClass: aBehavior selector: aSelector.
	window openInWorld.
	^ window! !

!IdeBrowserWindow class methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 17:32:53'!
implementorLabelFor: aMethodReference

	^ String streamContents: [:stream |
		aMethodReference printClassAndSelectorOn: stream ]! !

!IdeBrowserWindow class methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 17:32:53'!
openImplementorSelectionFor: aSelector

	| implementors |
	implementors := Smalltalk allImplementorsOf: aSelector.
	implementors isEmpty ifTrue: [ ^ nil ].
	implementors size = 1 ifTrue: [ ^ self openOnMethodReference: implementors first ].
	^ self presentImplementorMenuFor: implementors selector: aSelector! !

!IdeBrowserWindow class methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 17:32:53'!
openOnMethodReference: aMethodReference

	^ self openOnClass: aMethodReference methodClass selector: aMethodReference selector! !

!IdeBrowserWindow class methodsFor: 'navigation' stamp: 'GC 11/Apr/2026 17:32:53'!
presentImplementorMenuFor: methodReferences selector: aSelector

	| menu |
	menu := MenuMorph entitled: 'Implementors of ', aSelector asString.
	methodReferences do: [:each |
		menu
			add: (self implementorLabelFor: each)
			target: self
			action: #openOnMethodReference:
			argumentList: { each } ].
	menu popUpInWorld.
	^ menu! !

!IdeMethodWrapper methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:55:59'!
protocolName
	^ protocolName! !

!IdeMethodWrapper methodsFor: 'private' stamp: 'GC 4/Apr/2026 03:55:59'!
protocolName: aProtocolName
	protocolName := aProtocolName! !

!IdeMethodWrapper class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:55:59'!
selector: aSelector protocol: aProtocolName model: aModel
	^ self new
		setItem: aSelector model: aModel;
		protocolName: aProtocolName;
		yourself! !

!IdeProtocolWrapper methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:55:59'!
contents
	^ model methodWrappersForProtocol: item! !

!IdeProtocolWrapper methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 04:31:25'!
isAncestorOf: anObject
	| target |
	target := (anObject respondsTo: #withoutListWrapper)
		ifTrue: [ anObject withoutListWrapper ]
		ifFalse: [ anObject ].
	^ self contents anySatisfy: [:each | each withoutListWrapper = target ]! !
