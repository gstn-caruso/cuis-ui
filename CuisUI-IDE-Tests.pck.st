'From Cuis7.7 [latest update: #7777] on 4 April 2026 at 11:47:17 pm'!
'Description '!
!provides: 'CuisUI-IDE-Tests' 1 31!
SystemOrganization addCategory: #'CuisUI-IDE-Tests'!


!classDefinition: #IdeBreakpointTarget category: #'CuisUI-IDE-Tests'!
Object subclass: #IdeBreakpointTarget
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeBreakpointTarget class' category: #'CuisUI-IDE-Tests'!
IdeBreakpointTarget class
	instanceVariableNames: ''!

!classDefinition: #IdeFakeKeyboardEvent category: #'CuisUI-IDE-Tests'!
Object subclass: #IdeFakeKeyboardEvent
	instanceVariableNames: 'keyCharacter shiftPressed wasHandled'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeFakeKeyboardEvent class' category: #'CuisUI-IDE-Tests'!
IdeFakeKeyboardEvent class
	instanceVariableNames: ''!

!classDefinition: #IdeFakeQuickActionProvider category: #'CuisUI-IDE-Tests'!
Object subclass: #IdeFakeQuickActionProvider
	instanceVariableNames: 'actions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeFakeQuickActionProvider class' category: #'CuisUI-IDE-Tests'!
IdeFakeQuickActionProvider class
	instanceVariableNames: ''!

!classDefinition: #IdeKeyboardProbeMorph category: #'CuisUI-IDE-Tests'!
Morph subclass: #IdeKeyboardProbeMorph
	instanceVariableNames: 'keystrokeCount consumeShiftReturn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeKeyboardProbeMorph class' category: #'CuisUI-IDE-Tests'!
IdeKeyboardProbeMorph class
	instanceVariableNames: ''!

!classDefinition: #IdeBrowserModelTest category: #'CuisUI-IDE-Tests'!
TestCase subclass: #IdeBrowserModelTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeBrowserModelTest class' category: #'CuisUI-IDE-Tests'!
IdeBrowserModelTest class
	instanceVariableNames: ''!

!classDefinition: #IdeBrowserWindowTest category: #'CuisUI-IDE-Tests'!
TestCase subclass: #IdeBrowserWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeBrowserWindowTest class' category: #'CuisUI-IDE-Tests'!
IdeBrowserWindowTest class
	instanceVariableNames: ''!

!classDefinition: #IdeMethodBreakpointActionProviderTest category: #'CuisUI-IDE-Tests'!
TestCase subclass: #IdeMethodBreakpointActionProviderTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeMethodBreakpointActionProviderTest class' category: #'CuisUI-IDE-Tests'!
IdeMethodBreakpointActionProviderTest class
	instanceVariableNames: ''!

!classDefinition: #IdeQuickActionContextTest category: #'CuisUI-IDE-Tests'!
TestCase subclass: #IdeQuickActionContextTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeQuickActionContextTest class' category: #'CuisUI-IDE-Tests'!
IdeQuickActionContextTest class
	instanceVariableNames: ''!

!classDefinition: #IdeQuickActionControllerTest category: #'CuisUI-IDE-Tests'!
TestCase subclass: #IdeQuickActionControllerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeQuickActionControllerTest class' category: #'CuisUI-IDE-Tests'!
IdeQuickActionControllerTest class
	instanceVariableNames: ''!

!classDefinition: #IdeQuickActionTest category: #'CuisUI-IDE-Tests'!
TestCase subclass: #IdeQuickActionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Tests'!
!classDefinition: 'IdeQuickActionTest class' category: #'CuisUI-IDE-Tests'!
IdeQuickActionTest class
	instanceVariableNames: ''!


!IdeBreakpointTarget methodsFor: 'examples' stamp: 'GC 4/Apr/2026 03:44:18'!
sampleMethod
	^ 1! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
isReturnKey

	^ true! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
keyCharacter

	^ keyCharacter! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
keyCharacter: aCharacter

	keyCharacter := aCharacter! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
keyValue

	^ keyCharacter asciiValue! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
shiftPressed

	^ shiftPressed = true! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
shiftPressed: aBoolean

	shiftPressed := aBoolean! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
wasHandled

	^ wasHandled = true! !

!IdeFakeKeyboardEvent methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:54:19'!
wasHandled: aBoolean

	wasHandled := aBoolean! !

!IdeFakeKeyboardEvent class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 20:54:19'!
shiftReturn

	^ self new
		keyCharacter: Character newLineCharacter;
		shiftPressed: true;
		yourself! !

!IdeFakeQuickActionProvider methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:43:37'!
actions: aCollection
	actions := aCollection! !

!IdeFakeQuickActionProvider methodsFor: 'actions' stamp: 'GC 4/Apr/2026 03:43:37'!
actionsFor: aContext
	^ actions ifNil: [ #() ]! !

!IdeFakeQuickActionProvider class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:43:37'!
with: aCollection
	^ self new
		actions: aCollection;
		yourself! !

!IdeKeyboardProbeMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 06:17:56'!
initialize
	super initialize.
	keystrokeCount := 0.
	consumeShiftReturn := false! !

!IdeKeyboardProbeMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 06:17:56'!
consumeShiftReturn: aBoolean
	consumeShiftReturn := aBoolean! !

!IdeKeyboardProbeMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 06:17:56'!
keystrokeCount
	^ keystrokeCount! !

!IdeKeyboardProbeMorph methodsFor: 'events' stamp: 'GC 4/Apr/2026 06:17:56'!
handlesShiftReturnAsEditingCommand
	^ consumeShiftReturn! !

!IdeKeyboardProbeMorph methodsFor: 'events' stamp: 'GC 4/Apr/2026 06:17:56'!
keyStroke: aKeyboardEvent
	super keyStroke: aKeyboardEvent.
	keystrokeCount := keystrokeCount + 1.
	aKeyboardEvent wasHandled: true! !

!IdeBrowserModelTest methodsFor: 'running' stamp: 'GC 4/Apr/2026 20:54:19'!
tearDown

	(IdeBrowserSampleClass includesSelector: #alphaOne) ifTrue: [
		IdeBrowserSampleClass compile: 'alphaOne
	^ ''alpha-one''' classified: 'alpha' notifying: nil ].
	super tearDown! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testAcceptCompilesTheSelectedMethod

	| browser accepted |
	browser := self browserOnSampleMethod.

	accepted := browser contents: 'alphaOne
	^ ''changed''' notifying: nil.

	self assert: accepted.
	self assert: IdeBrowserSampleClass new alphaOne equals: 'changed'! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testAcceptsTheSelectedClassDefinition

	| browser accepted |
	browser := self browserOnSampleClass.

	accepted := browser contents: browser acceptedStringOrText asText notifying: nil.

	self assert: accepted.
	self assert: browser selectedClass equals: IdeBrowserSampleClass! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testCanSelectAClassByNameEvenWhenTheListIsIndented

	| browser |
	browser := self newBrowser.
	browser selectPackageNamed: 'Collections'.
	browser selectClassNamed: 'SortedCollection'.

	self assert: browser selectedClass equals: SortedCollection.
	self assert: browser classListIndex > 0! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testGroupsMethodsByProtocol

	| browser roots alphaRoot |
	browser := self browserOnSampleClass.
	roots := browser methodRoots.
	alphaRoot := roots detect: [:each | each asString = 'alpha'].

	self assert: (roots collect: [:each | each asString]) asSet equals: (Set with: 'alpha' with: 'beta').
	self assert: (alphaRoot contents collect: [:each | each asString]) asArray equals: #('alphaOne' 'alphaTwo')! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testListsAvailablePackages

	| browser |
	browser := self newBrowser.

	self assert: (browser packageList includes: 'CuisUI-IDE-Browser').
	self assert: (browser packageList includes: 'Kernel-Objects').
	self assert: (browser packageList includes: 'Collections-Arrayed')! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testPackageTreeGroupsPackagesByPrefix

	| browser collectionsRoot childNames |
	browser := self newBrowser.
	collectionsRoot := browser packageRoots detect: [:each | each asString = 'Collections'].
	childNames := collectionsRoot contents collect: [:each | each asString].

	self assert: (childNames includes: 'Arrayed').
	self assert: (childNames includes: 'Streams').
	self assert: (childNames includes: 'Sequenceable')! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testSelectingAMethodShowsItsSource

	| browser |
	browser := self browserOnSampleMethod.

	self assert: (browser acceptedStringOrText includesSubString: 'alphaOne')! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testSelectingAPackageListsItsClasses

	| browser |
	browser := self newBrowser.
	browser selectPackageNamed: 'CuisUI-IDE-Browser'.

	self assert: (browser classList anySatisfy: [:each | each withoutLeadingBlanks = 'IdeBrowserWindow']).
	self assert: (browser classList anySatisfy: [:each | each withoutLeadingBlanks = 'IdeBrowserSampleClass'])! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testSelectingAPackageTreeBranchUpdatesTheSelectedPackage

	| browser collectionsRoot arrayed |
	browser := self newBrowser.
	collectionsRoot := browser packageRoots detect: [:each | each asString = 'Collections'].
	arrayed := collectionsRoot contents detect: [:each | each asString = 'Arrayed'].

	browser setSelectedPackageTreeItem: collectionsRoot.
	self assert: browser selectedPackageName equals: 'Collections'.
	self assert: (browser classList anySatisfy: [:each | each withoutLeadingBlanks = 'OrderedCollection']).

	browser setSelectedPackageTreeItem: arrayed.
	self assert: browser selectedPackageName equals: 'Collections-Arrayed'.
	self assert: browser packageListIndex equals: (browser packageList indexOf: 'Collections-Arrayed').
	self assert: (browser classList anySatisfy: [:each | each withoutLeadingBlanks = 'Array2D'])! !

!IdeBrowserModelTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:45:21'!
testUsesSmalltalkEditorForAcceptedContents

	self assert: (self newBrowser editorClassFor: #acceptedContents) equals: SmalltalkEditor! !

!IdeBrowserModelTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:45:21'!
browserOnPackage: aPackageName classNamed: aClassName

	| browser |
	browser := self newBrowser.
	browser selectPackageNamed: aPackageName.
	browser selectClassNamed: aClassName.
	^ browser! !

!IdeBrowserModelTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:45:21'!
browserOnSampleClass

	^ self browserOnPackage: 'CuisUI-IDE-Browser' classNamed: 'IdeBrowserSampleClass'! !

!IdeBrowserModelTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:45:21'!
browserOnSampleMethod

	| browser |
	browser := self browserOnSampleClass.
	browser selectedMethodTreeItem: (self sampleAlphaMethodIn: browser).
	^ browser! !

!IdeBrowserModelTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:45:21'!
newBrowser

	^ IdeBrowserModel new! !

!IdeBrowserModelTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:45:21'!
sampleAlphaMethodIn: aBrowser

	^ (aBrowser methodRoots detect: [:each | each asString = 'alpha']) contents first! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testBuildsAWorkingCodeEditor

	| window |
	window := self openBrowserWindow.

	self assert: window codePaneMorph notNil.
	self assert: (self editorIn: window) notNil! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testCannotBuildAWindowWithoutAModel

	self should: [ IdeBrowserWindow new buildMorphicWindow ] raise: Error! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testCannotBuildTheSameWindowTwice

	| window |
	window := IdeBrowserWindow on: IdeBrowserModel new.

	self should: [ window buildMorphicWindow ] raise: Error! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testLineNumbersTrackEditedSource

	| window editor source |
	window := self openBrowserOnSampleMethod.
	editor := self editorIn: window.
	source := 'alphaOne
sasda
^ ''alpha-one''

asadsa

dsadsd'.
	editor selectAll.
	editor replaceSelectionWith: source.

	self assert: window codePaneMorph gutter currentLineCount equals: 7! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testOnBuildsAWindowForAModel

	| model window |
	model := IdeBrowserModel new.
	window := IdeBrowserWindow on: model.

	self assert: window model == model.
	self assert: window codePaneMorph notNil.
	self assert: window label equals: 'IDE Browser'! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testOpensSelectingARealPackage

	| window browser |
	window := self openBrowserWindow.
	browser := window model.

	self assert: browser packageListIndex equals: 1.
	self deny: browser classList isEmpty.
	self deny: (browser packageList at: browser packageListIndex) = '-- All System --'! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testSelectingAMethodEnablesEditing

	| window |
	window := self openBrowserOnSampleMethod.

	self deny: window codePaneMorph textPane innerTextMorph disablesEditing! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testSelectingAMethodRevealsItInTheMethodTree

	| browser tree alphaProtocol alphaMethod |
	browser := IdeBrowserModel new.
	browser selectPackageNamed: 'CuisUI-IDE-Browser'.
	browser selectClassNamed: 'IdeBrowserSampleClass'.
	tree := HierarchicalListMorph
		withModel: browser
		listGetter: #methodRoots
		indexGetter: #selectedMethodTreeItem
		indexSetter: #selectedMethodTreeItem:.
	tree autoExpand: true.
	tree list: browser methodRoots.
	alphaProtocol := browser methodRoots detect: [:each | each asString = 'alpha'].
	alphaMethod := alphaProtocol contents first.

	browser selectedMethodTreeItem: alphaMethod.
	tree update: #selectedMethodTreeItem.

	self assert: tree selectedMorph notNil.
	self assert: tree selectedMorph complexContents withoutListWrapper equals: #alphaOne.
	self assert: ((tree scroller submorphs collect: [:each | each complexContents asString]) includes: 'alphaOne')! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testShiftEnterInsertsABlankLineBelowTheCurrentLine

	| window editor event |
	window := self openBrowserOnSampleMethod.
	editor := self editorIn: window.
	editor selectAll.
	editor replaceSelectionWith: 'first line', String newLineString, 'second line'.
	window codePaneMorph step.
	editor deselectAndPlaceCursorAt: 3.
	event := self sendShiftReturnTo: window codePaneMorph textPane innerTextMorph.

	self assert: editor actualContents asString equals: 'first line', String newLineString, String newLineString, 'second line'.
	self assert: editor pointIndex equals: 3.
	self assert: event wasHandled! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testShiftEnterKeepsCurrentIndentation

	| window editor event |
	window := self openBrowserOnSampleMethod.
	editor := self editorIn: window.
	editor selectAll.
	editor replaceSelectionWith: Character tab asString, 'indented line', String newLineString, 'next'.
	window codePaneMorph step.
	editor deselectAndPlaceCursorAt: 4.
	event := self sendShiftReturnTo: window codePaneMorph textPane innerTextMorph.

	self assert: editor actualContents asString equals: Character tab asString, 'indented line', String newLineString, Character tab asString, String newLineString, 'next'.
	self assert: editor pointIndex equals: 4.
	self assert: event wasHandled! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testShiftReturnStillTriggersClassFinderOutsideIdeBrowser

	| probe event classFinderPreference originalValue preferenceWasTriggered |
	probe := IdeKeyboardProbeMorph new.
	probe consumeShiftReturn: false.
	preferenceWasTriggered := false.
	classFinderPreference := Preferences instanceAt: #classFinder.
	originalValue := classFinderPreference instVarNamed: 'value'.
	[
		classFinderPreference value: [ preferenceWasTriggered := true ].
		event := self sendShiftReturnTo: probe.
	] ensure: [ classFinderPreference value: originalValue ].

	self assert: preferenceWasTriggered.
	self assert: probe keystrokeCount equals: 0.
	self assert: event wasHandled! !

!IdeBrowserWindowTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 23:46:11'!
testShiftReturnUsesEditorCommandInsideIdeBrowser

	| window editor event classFinderPreference originalValue preferenceWasTriggered |
	window := self openBrowserOnSampleMethod.
	editor := self editorIn: window.
	editor selectAll.
	editor replaceSelectionWith: 'first line', String newLineString, 'second line'.
	window codePaneMorph step.
	editor deselectAndPlaceCursorAt: 3.
	preferenceWasTriggered := false.
	classFinderPreference := Preferences instanceAt: #classFinder.
	originalValue := classFinderPreference instVarNamed: 'value'.
	[
		classFinderPreference value: [ preferenceWasTriggered := true ].
		event := self sendShiftReturnTo: window codePaneMorph textPane innerTextMorph.
	] ensure: [ classFinderPreference value: originalValue ].

	self deny: preferenceWasTriggered.
	self assert: event wasHandled.
	self assert: editor actualContents asString equals: 'first line', String newLineString, String newLineString, 'second line'! !

!IdeBrowserWindowTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:46:11'!
editorIn: aWindow

	^ aWindow codePaneMorph textPane editor! !

!IdeBrowserWindowTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:46:11'!
openBrowserOnSampleClass

	| window model |
	window := self openBrowserWindow.
	model := window model.
	model selectPackageNamed: 'CuisUI-IDE-Browser'.
	model selectClassNamed: 'IdeBrowserSampleClass'.
	^ window! !

!IdeBrowserWindowTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:46:11'!
openBrowserOnSampleMethod

	| window model alphaMethod |
	window := self openBrowserOnSampleClass.
	model := window model.
	alphaMethod := (model methodRoots detect: [:each | each asString = 'alpha']) contents first.
	model selectedMethodTreeItem: alphaMethod.
	^ window! !

!IdeBrowserWindowTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:46:11'!
openBrowserWindow

	^ IdeBrowserWindow on: IdeBrowserModel new! !

!IdeBrowserWindowTest methodsFor: 'helpers' stamp: 'GC 4/Apr/2026 23:27:42'!
sendShiftReturnTo: aMorph

	| event |
	event := KeyboardEvent new.
	event setType: #keystroke
		buttons: InputSensor shiftKey
		position: 0@0
		keyValue: InputSensor returnKey
		hand: nil
		stamp: Time localMillisecondClock.
	event sendEventTo: aMorph.
	^ event! !

!IdeMethodBreakpointActionProviderTest methodsFor: 'running' stamp: 'GC 4/Apr/2026 03:44:18'!
tearDown
	| method |
	method := IdeBreakpointTarget >> #sampleMethod.
	method hasBreakpoint ifTrue: [ method uninstall ].
	super tearDown! !

!IdeMethodBreakpointActionProviderTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 05:29:54'!
testBreakpointActionDoesNotShowLightbulbAffordance
	| provider action |
	provider := IdeMethodBreakpointActionProvider new.
	action := (provider actionsFor: (IdeQuickActionContext forClass: IdeBreakpointTarget selector: #sampleMethod)) first.

	self deny: action showsLightbulbAffordance! !

!IdeMethodBreakpointActionProviderTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:44:19'!
testDoesNotOfferBreakpointActionWithoutMethodSelection
	| provider |
	provider := IdeMethodBreakpointActionProvider new.

	self assert: (provider actionsFor: IdeQuickActionContext new) isEmpty! !

!IdeMethodBreakpointActionProviderTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:44:18'!
testOffersBreakpointActionForMethodSelection
	| provider actions |
	provider := IdeMethodBreakpointActionProvider new.

	actions := provider actionsFor: (IdeQuickActionContext forClass: IdeBreakpointTarget selector: #sampleMethod).

	self assert: actions size equals: 1.
	self assert: actions first id equals: #toggleBreakpoint! !

!IdeMethodBreakpointActionProviderTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:45:04'!
testTogglesBreakpointOnSelectedMethod
	| provider action |
	provider := IdeMethodBreakpointActionProvider new.
	action := (provider actionsFor: (IdeQuickActionContext forClass: IdeBreakpointTarget selector: #sampleMethod)) first.

	self deny: (IdeBreakpointTarget >> #sampleMethod) hasBreakpoint.
	action perform.
	self assert: (IdeBreakpointTarget >> #sampleMethod) hasBreakpoint.
	action perform.
	self deny: (IdeBreakpointTarget >> #sampleMethod) hasBreakpoint! !

!IdeQuickActionContextTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:43:07'!
testDoesNotReportMethodSelectionWithoutSelector
	| context |
	context := IdeQuickActionContext new.
	context selectedClass: Object.

	self deny: context isMethodSelection! !

!IdeQuickActionContextTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:43:07'!
testReportsMethodSelectionWhenClassAndSelectorArePresent
	| context |
	context := IdeQuickActionContext forClass: Object selector: #halt.

	self assert: context isMethodSelection.
	self assert: context selectedClass equals: Object.
	self assert: context selectedSelector equals: #halt! !

!IdeQuickActionControllerTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:43:38'!
testAnswersNoActionsWhenThereAreNoProviders
	| controller |
	controller := IdeQuickActionController withProviders: #().

	self assert: (controller actionsFor: IdeQuickActionContext new) isEmpty! !

!IdeQuickActionControllerTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:43:57'!
testCollectsActionsFromProviders
	| first second controller actions |
	first := IdeQuickAction id: #toggleBreakpoint label: 'Toggle breakpoint'.
	second := IdeQuickAction id: #browseImplementors label: 'Browse implementors'.
	controller := IdeQuickActionController withProviders: {
		(IdeFakeQuickActionProvider with: { first }).
		(IdeFakeQuickActionProvider with: { second }) }.

	actions := controller actionsFor: IdeQuickActionContext new.

	self assert: (actions collect: [:each | each id]) asArray equals: #(toggleBreakpoint browseImplementors)! !

!IdeQuickActionControllerTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:45:51'!
testDefaultControllerOffersBreakpointActionForMethodSelection
	| controller actions |
	controller := IdeQuickActionController default.

	actions := controller actionsFor: (IdeQuickActionContext forClass: IdeBreakpointTarget selector: #sampleMethod).

	self assert: (actions anySatisfy: [:each | each id = #toggleBreakpoint ])! !

!IdeQuickActionControllerTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 05:29:54'!
testLightbulbActionsExcludeBreakpointActions
	| controller actions |
	controller := IdeQuickActionController default.

	actions := controller lightbulbActionsFor: (IdeQuickActionContext forClass: IdeBreakpointTarget selector: #sampleMethod).

	self assert: actions isEmpty! !

!IdeQuickActionTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:42:44'!
testEvaluatesItsCommand
	| action wasRun |
	wasRun := false.
	action := IdeQuickAction
		id: #toggleBreakpoint
		label: 'Toggle breakpoint'
		do: [ wasRun := true ].

	action perform.

	self assert: wasRun! !

!IdeQuickActionTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 03:42:17'!
testRemembersIdentityAndLabel
	| action |
	action := IdeQuickAction id: #toggleBreakpoint label: 'Toggle breakpoint'.

	self assert: action id equals: #toggleBreakpoint.
	self assert: action label equals: 'Toggle breakpoint'! !

!IdeQuickActionTest methodsFor: 'tests' stamp: 'GC 4/Apr/2026 05:29:54'!
testShowsLightbulbAffordanceByDefault
	self assert: (IdeQuickAction id: #rename label: 'Rename') showsLightbulbAffordance! !
