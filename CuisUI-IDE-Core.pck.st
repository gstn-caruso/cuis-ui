'From Cuis7.7 [latest update: #7777] on 11 April 2026 at 9:57:42 pm'!
'Description '!
!provides: 'CuisUI-IDE-Core' 1 20!
SystemOrganization addCategory: #'CuisUI-IDE-Core'!


!classDefinition: #IdeEditorCommands category: #'CuisUI-IDE-Core'!
Object subclass: #IdeEditorCommands
	instanceVariableNames: 'textPane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeEditorCommands class' category: #'CuisUI-IDE-Core'!
IdeEditorCommands class
	instanceVariableNames: ''!

!classDefinition: #IdeEditorTheme category: #'CuisUI-IDE-Core'!
Object subclass: #IdeEditorTheme
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeEditorTheme class' category: #'CuisUI-IDE-Core'!
IdeEditorTheme class
	instanceVariableNames: 'currentStyle'!

!classDefinition: #IdeGoToDefinitionAnalyzer category: #'CuisUI-IDE-Core'!
Object subclass: #IdeGoToDefinitionAnalyzer
	instanceVariableNames: 'source context index methodNode messageNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeGoToDefinitionAnalyzer class' category: #'CuisUI-IDE-Core'!
IdeGoToDefinitionAnalyzer class
	instanceVariableNames: ''!

!classDefinition: #IdeMethodBreakpointActionProvider category: #'CuisUI-IDE-Core'!
Object subclass: #IdeMethodBreakpointActionProvider
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeMethodBreakpointActionProvider class' category: #'CuisUI-IDE-Core'!
IdeMethodBreakpointActionProvider class
	instanceVariableNames: ''!

!classDefinition: #IdeQuickAction category: #'CuisUI-IDE-Core'!
Object subclass: #IdeQuickAction
	instanceVariableNames: 'id label commandBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeQuickAction class' category: #'CuisUI-IDE-Core'!
IdeQuickAction class
	instanceVariableNames: ''!

!classDefinition: #IdeBreakpointQuickAction category: #'CuisUI-IDE-Core'!
IdeQuickAction subclass: #IdeBreakpointQuickAction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeBreakpointQuickAction class' category: #'CuisUI-IDE-Core'!
IdeBreakpointQuickAction class
	instanceVariableNames: ''!

!classDefinition: #IdeQuickActionContext category: #'CuisUI-IDE-Core'!
Object subclass: #IdeQuickActionContext
	instanceVariableNames: 'selectedClass selectedSelector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeQuickActionContext class' category: #'CuisUI-IDE-Core'!
IdeQuickActionContext class
	instanceVariableNames: ''!

!classDefinition: #IdeQuickActionController category: #'CuisUI-IDE-Core'!
Object subclass: #IdeQuickActionController
	instanceVariableNames: 'providers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeQuickActionController class' category: #'CuisUI-IDE-Core'!
IdeQuickActionController class
	instanceVariableNames: ''!

!classDefinition: #IdeCodeGutterMorph category: #'CuisUI-IDE-Core'!
ColoredBoxMorph subclass: #IdeCodeGutterMorph
	instanceVariableNames: 'textPane browserModel quickActionController'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeCodeGutterMorph class' category: #'CuisUI-IDE-Core'!
IdeCodeGutterMorph class
	instanceVariableNames: ''!

!classDefinition: #IdeCodePaneMorph category: #'CuisUI-IDE-Core'!
BorderedBoxMorph subclass: #IdeCodePaneMorph
	instanceVariableNames: 'textPane gutter quickActionOverlay browserModel quickActionController'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeCodePaneMorph class' category: #'CuisUI-IDE-Core'!
IdeCodePaneMorph class
	instanceVariableNames: ''!

!classDefinition: #IdeQuickActionOverlayMorph category: #'CuisUI-IDE-Core'!
ImageMorph subclass: #IdeQuickActionOverlayMorph
	instanceVariableNames: 'browserModel quickActionController'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeQuickActionOverlayMorph class' category: #'CuisUI-IDE-Core'!
IdeQuickActionOverlayMorph class
	instanceVariableNames: ''!

!classDefinition: #IdeCodeTextMorph category: #'CuisUI-IDE-Core'!
TextModelMorph subclass: #IdeCodeTextMorph
	instanceVariableNames: 'codePane editorCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeCodeTextMorph class' category: #'CuisUI-IDE-Core'!
IdeCodeTextMorph class
	instanceVariableNames: ''!

!classDefinition: #IdeNavigationWindow category: #'CuisUI-IDE-Core'!
CodeWindow subclass: #IdeNavigationWindow
	instanceVariableNames: 'codePaneMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeNavigationWindow class' category: #'CuisUI-IDE-Core'!
IdeNavigationWindow class
	instanceVariableNames: ''!

!classDefinition: #IdeInnerTextMorph category: #'CuisUI-IDE-Core'!
InnerTextMorph subclass: #IdeInnerTextMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUI-IDE-Core'!
!classDefinition: 'IdeInnerTextMorph class' category: #'CuisUI-IDE-Core'!
IdeInnerTextMorph class
	instanceVariableNames: ''!


!IdeEditorCommands methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 22:45:31'!
textPane: aTextPane

	textPane := aTextPane! !

!IdeEditorCommands methodsFor: 'editing' stamp: 'GC 4/Apr/2026 22:45:31'!
handleShiftReturnEvent: aKeyboardEvent

	| editor source lineStart lineEnd insertAt indentation scanIndex character insertion originalPoint |
	editor := textPane editor.
	source := editor privateCurrentString asString.
	originalPoint := editor pointIndex.
	lineStart := editor beginningOfLine: originalPoint.
	lineEnd := editor endOfLine: originalPoint.
	insertAt := lineEnd.
	indentation := String streamContents: [:stream |
		scanIndex := lineStart.
		[ scanIndex <= source size and: [
			character := source at: scanIndex.
			(character = Character space or: [ character = Character tab ]) ] ] whileTrue: [
			stream nextPut: character.
			scanIndex := scanIndex + 1 ]].
	insertion := String newLineString , indentation.
	editor selectFrom: insertAt to: insertAt - 1.
	editor replaceSelectionWith: insertion.
	editor deselectAndPlaceCursorAt: originalPoint.
	^ true! !

!IdeEditorCommands class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 22:45:31'!
onTextPane: aTextPane

	^ self new
		textPane: aTextPane;
		yourself! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
activeLineNumberColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.83 g: 0.84 b: 0.84 ]
		ifFalse: [ Color r: 0.11 g: 0.11 b: 0.11 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
caretColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.68 g: 0.69 b: 0.68 ]
		ifFalse: [ Color r: 0.02 g: 0.02 b: 0.02 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
caretOccurrenceColor
	^ self isDarkStyle
		ifTrue: [ (Color r: 0.23 g: 0.24 b: 0.25) alpha: 0.72 ]
		ifFalse: [ (Color r: 0.86 g: 0.89 b: 0.94) alpha: 0.9 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
currentLineHighlightColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.16 g: 0.18 b: 0.18 ]
		ifFalse: [ Color r: 0.95 g: 0.96 b: 0.97 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
editorBackgroundColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.12 g: 0.12 b: 0.12 ]
		ifFalse: [ Color white ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
editorForegroundColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.83 g: 0.84 b: 0.84 ]
		ifFalse: [ Color r: 0.11 g: 0.11 b: 0.11 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
focusedSelectionColor
	^ self isDarkStyle
		ifTrue: [ (Color r: 0.15 g: 0.31 b: 0.47) alpha: 0.88 ]
		ifFalse: [ (Color r: 0.68 g: 0.84 b: 1.0) alpha: 0.9 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
gutterBackgroundColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.15 g: 0.15 b: 0.15 ]
		ifFalse: [ Color r: 0.96 g: 0.96 b: 0.96 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
gutterCurrentLineColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.18 g: 0.19 b: 0.20 ]
		ifFalse: [ Color r: 0.92 g: 0.94 b: 0.96 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
lineNumberColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.52 g: 0.52 b: 0.52 ]
		ifFalse: [ Color r: 0.43 g: 0.43 b: 0.43 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
paneBorderColor
	^ self isDarkStyle
		ifTrue: [ Color r: 0.18 g: 0.18 b: 0.19 ]
		ifFalse: [ Color r: 0.88 g: 0.88 b: 0.88 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
selectedOccurrenceColor
	^ self isDarkStyle
		ifTrue: [ (Color r: 0.32 g: 0.36 b: 0.42) alpha: 0.55 ]
		ifFalse: [ (Color r: 0.80 g: 0.86 b: 0.94) alpha: 0.75 ]! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
separatorColor
	^ self paneBorderColor! !

!IdeEditorTheme class methodsFor: 'colors' stamp: 'GC 4/Apr/2026 05:50:06'!
unfocusedSelectionColor
	^ self isDarkStyle
		ifTrue: [ (Color r: 0.23 g: 0.24 b: 0.25) alpha: 0.82 ]
		ifFalse: [ (Color r: 0.83 g: 0.87 b: 0.93) alpha: 0.85 ]! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 20:02:32'!
codeFont

	| standard preferredName |
	standard := Preferences at: #standardCodeFont.
	preferredName := self preferredCodeFontNames
		detect: [:each | (FontFamily familyNamed: each) notNil]
		ifNone: [
			self loadPreferredCodeFontsIfNeeded.
			self preferredCodeFontNames
				detect: [:each | (FontFamily familyNamed: each) notNil]
				ifNone: [ nil ]].
	preferredName ifNil: [ ^ standard ].
	^ (FontFamily familyName: preferredName pointSize: standard pointSize)
		ifNil: [ standard ]! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 05:50:06'!
currentStyle
	^ currentStyle ifNil: [ currentStyle := #light ]! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 05:50:06'!
currentStyle: aSymbol
	currentStyle := aSymbol.
	self refreshOpenBrowsers! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 05:50:06'!
isDarkStyle
	^ self currentStyle = #dark! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 20:03:28'!
loadPreferredCodeFontsIfNeeded

	(self preferredCodeFontNames anySatisfy: [:each | (FontFamily familyNamed: each) notNil ]) ifTrue: [ ^ self ].
	self preferredCodeFontFileEntries do: [:each |
		each existsAsFile ifTrue: [
			[ TrueTypeFontFamily readTrueTypeFontEntry: each ]
				on: Error
				do: [:ex | nil ]]]! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 20:02:13'!
preferredCodeFontDirectories

	^ {
		DirectoryEntry trueTypeFontsDirectory.
		'/Library/Fonts' asDirectoryEntry.
		'/System/Library/Fonts' asDirectoryEntry }! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 20:03:28'!
preferredCodeFontFileEntries

	^ {
		'/System/Library/Fonts/Menlo.ttc' asFileEntry.
		'/System/Library/Fonts/SFNSMono.ttf' asFileEntry.
		'/System/Library/Fonts/Courier.ttc' asFileEntry }! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 20:03:28'!
preferredCodeFontNames

	^ #('JetBrains Mono' 'JetBrains Mono NL' 'Menlo' '.SF NS Mono' 'Courier New' 'Courier' 'Monaco' 'Andale Mono' 'PT Mono' 'DejaVu Sans Mono')! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 05:50:06'!
refreshOpenBrowsers
	(SystemWindow windowsIn: UISupervisor ui satisfying: [:w | w class name = 'IdeBrowserWindow']) do: [:each |
		each allMorphsDo: [:m |
			(m respondsTo: #applyEditorTheme) ifTrue: [ m applyEditorTheme ]].
		each redrawNeeded ]! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 05:50:06'!
useDarkStyle
	self currentStyle: #dark! !

!IdeEditorTheme class methodsFor: 'style' stamp: 'GC 4/Apr/2026 05:50:06'!
useLightStyle
	self currentStyle: #light! !

!IdeEditorTheme class methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 16:35:38'!
activeOccurrenceBorderColor
	^ self isDarkStyle
		ifTrue: [ Color white alpha: 0.24 ]
		ifFalse: [ Color black alpha: 0.18 ]! !

!IdeEditorTheme class methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 16:35:38'!
activeOccurrenceColor
	^ self isDarkStyle
		ifTrue: [ (Color r: 0.33 g: 0.40 b: 0.49) alpha: 0.82 ]
		ifFalse: [ (Color r: 0.66 g: 0.78 b: 0.93) alpha: 0.92 ]! !

!IdeGoToDefinitionAnalyzer methodsFor: 'accessing' stamp: 'GC 11/Apr/2026 17:48:54'!
context: aBehavior

	context := aBehavior! !

!IdeGoToDefinitionAnalyzer methodsFor: 'accessing' stamp: 'GC 11/Apr/2026 17:48:54'!
index: anInteger

	index := anInteger! !

!IdeGoToDefinitionAnalyzer methodsFor: 'accessing' stamp: 'GC 11/Apr/2026 17:48:54'!
source: aString

	source := aString! !

!IdeGoToDefinitionAnalyzer methodsFor: 'analysis' stamp: 'GC 11/Apr/2026 17:48:54'!
analyze

	| parsed |
	parsed := self parseMethodNode.
	parsed ifNil: [ ^ nil ].
	methodNode := parsed.
	messageNode := self messageNodeAtCursor.
	messageNode ifNil: [ ^ nil ].
	^ { self selectorSymbol. self receiverBehavior }! !

!IdeGoToDefinitionAnalyzer methodsFor: 'analysis' stamp: 'GC 11/Apr/2026 17:48:54'!
messageNodeAtCursor

	methodNode ifNil: [ ^ nil ].
	methodNode nodesDo: [:node |
		(node isMessageNode and: [ self pointIsWithinSelectorOf: node ]) ifTrue: [ ^ node ] ].
	^ nil! !

!IdeGoToDefinitionAnalyzer methodsFor: 'analysis' stamp: 'GC 11/Apr/2026 17:48:54'!
parseMethodNode

	| parser behavior |
	source ifNil: [ ^ nil ].
	behavior := context ifNil: [ Object ].
	parser := Parser new.
	[^ parser
		parse: source readStream
		class: behavior
		noPattern: false
		context: nil
		notifying: nil
		ifFail: [ ^ nil ] ] on: Error do: [ ^ nil ]! !

!IdeGoToDefinitionAnalyzer methodsFor: 'analysis' stamp: 'GC 11/Apr/2026 17:48:54'!
pointIsWithinSelectorOf: aMessageNode

	| ranges |
	ranges := aMessageNode keywordRanges.
	(ranges isNil or: [ ranges isEmpty ]) ifTrue: [
		| fullRange |
		fullRange := methodNode rangeForNode: aMessageNode ifAbsent: [ nil ].
		fullRange ifNil: [ ^ false ].
		^ fullRange first <= index and: [ index <= fullRange last ] ].
	^ ranges anySatisfy: [:each | each first <= index and: [ index <= each last ]]! !

!IdeGoToDefinitionAnalyzer methodsFor: 'analysis' stamp: 'GC 11/Apr/2026 17:48:54'!
receiverBehavior

	| receiver name potential |
	messageNode ifNil: [ ^ nil ].
	receiver := messageNode receiver.
	receiver ifNil: [ ^ nil ].
	(receiver respondsTo: #name) ifFalse: [ ^ nil ].
	name := receiver name.
	name ifNil: [ ^ nil ].
	name = 'self' ifTrue: [ ^ context ].
	name = 'super' ifTrue: [ ^ context ifNotNil: [ context superclass ] ].
	(self looksLikeGlobalClassName: name) ifTrue: [
		potential := Smalltalk at: name asSymbol ifAbsent: [ nil ].
		(potential isBehavior)
			ifTrue: [ ^ potential class ]].
	^ nil! !

!IdeGoToDefinitionAnalyzer methodsFor: 'analysis' stamp: 'GC 11/Apr/2026 17:48:54'!
selectorSymbol

	| selectorNode |
	messageNode ifNil: [ ^ nil ].
	selectorNode := messageNode selector.
	selectorNode ifNil: [ ^ nil ].
	^ selectorNode isSymbol
		ifTrue: [ selectorNode ]
		ifFalse: [ selectorNode key ]! !

!IdeGoToDefinitionAnalyzer methodsFor: 'private' stamp: 'GC 11/Apr/2026 17:48:54'!
looksLikeGlobalClassName: aString

	^ aString isEmpty not and: [ aString first isUppercase ]! !

!IdeGoToDefinitionAnalyzer class methodsFor: 'instance creation' stamp: 'GC 11/Apr/2026 17:48:54'!
selectorAndReceiverFor: aString index: anInteger context: aBehavior

	^ self new
		source: aString;
		index: anInteger;
		context: aBehavior;
		analyze! !

!IdeMethodBreakpointActionProvider methodsFor: 'actions' stamp: 'GC 4/Apr/2026 03:44:36'!
actionsFor: aContext
	aContext isMethodSelection ifFalse: [ ^ #() ].
	^ { self toggleBreakpointActionFor: aContext }! !

!IdeMethodBreakpointActionProvider methodsFor: 'actions' stamp: 'GC 4/Apr/2026 05:29:54'!
toggleBreakpointActionFor: aContext
	^ IdeBreakpointQuickAction
		id: #toggleBreakpoint
		label: 'Toggle breakpoint'
		do: [ self toggleBreakpointFor: aContext ]! !

!IdeMethodBreakpointActionProvider methodsFor: 'actions' stamp: 'GC 4/Apr/2026 03:44:50'!
toggleBreakpointFor: aContext
	self toggleBreakpointOn: (aContext selectedClass >> aContext selectedSelector)! !

!IdeMethodBreakpointActionProvider methodsFor: 'actions' stamp: 'GC 4/Apr/2026 03:44:36'!
toggleBreakpointOn: aCompiledMethod
	aCompiledMethod hasBreakpoint
		ifTrue: [ aCompiledMethod uninstall ]
		ifFalse: [ (BreakingMethodWrapper on: aCompiledMethod) install ]! !

!IdeQuickAction methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:42:52'!
commandBlock: aBlock
	commandBlock := aBlock! !

!IdeQuickAction methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:42:26'!
id
	^ id! !

!IdeQuickAction methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:42:26'!
id: anObject
	id := anObject! !

!IdeQuickAction methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:42:26'!
label
	^ label! !

!IdeQuickAction methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:42:26'!
label: aString
	label := aString! !

!IdeQuickAction methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 05:29:54'!
showsLightbulbAffordance
	^ true! !

!IdeQuickAction methodsFor: 'actions' stamp: 'GC 4/Apr/2026 03:42:52'!
perform
	commandBlock value! !

!IdeQuickAction methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 03:42:52'!
initialize
	super initialize.
	commandBlock := [ ]! !

!IdeQuickAction class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:42:26'!
id: anId label: aLabel
	^ self new
		id: anId;
		label: aLabel;
		yourself! !

!IdeQuickAction class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:42:52'!
id: anId label: aLabel do: aBlock
	^ self new
		id: anId;
		label: aLabel;
		commandBlock: aBlock;
		yourself! !

!IdeBreakpointQuickAction methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 05:29:54'!
showsLightbulbAffordance
	^ false! !

!IdeQuickActionContext methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:43:17'!
selectedClass
	^ selectedClass! !

!IdeQuickActionContext methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:43:17'!
selectedClass: aClass
	selectedClass := aClass! !

!IdeQuickActionContext methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:43:17'!
selectedSelector
	^ selectedSelector! !

!IdeQuickActionContext methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:43:17'!
selectedSelector: aSelector
	selectedSelector := aSelector! !

!IdeQuickActionContext methodsFor: 'testing' stamp: 'GC 4/Apr/2026 03:43:17'!
isMethodSelection
	^ selectedClass notNil and: [ selectedSelector notNil ]! !

!IdeQuickActionContext class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:43:17'!
forClass: aClass selector: aSelector
	^ self new
		selectedClass: aClass;
		selectedSelector: aSelector;
		yourself! !

!IdeQuickActionController methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 03:43:47'!
providers: aCollection
	providers := aCollection! !

!IdeQuickActionController methodsFor: 'actions' stamp: 'GC 4/Apr/2026 03:43:47'!
actionsFor: aContext
	^ OrderedCollection streamContents: [:stream |
		(providers ifNil: [ #() ]) do: [:each |
			stream nextPutAll: (each actionsFor: aContext) ]]! !

!IdeQuickActionController methodsFor: 'actions' stamp: 'GC 4/Apr/2026 05:29:54'!
lightbulbActionsFor: aContext
	^ (self actionsFor: aContext) select: [:each | each showsLightbulbAffordance]! !

!IdeQuickActionController class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:45:59'!
default
	^ self withProviders: self defaultProviders! !

!IdeQuickActionController class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:45:59'!
defaultProviders
	^ { IdeMethodBreakpointActionProvider new }! !

!IdeQuickActionController class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 03:43:47'!
withProviders: aCollection
	^ self new
		providers: aCollection;
		yourself! !

!IdeCodeGutterMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 05:44:54'!
initialize
	super initialize.
	self color: IdeEditorTheme gutterBackgroundColor! !

!IdeCodeGutterMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 04:00:25'!
textPane: aTextPane model: aModel quickActionController: aQuickActionController
	textPane := aTextPane.
	browserModel := aModel.
	quickActionController := aQuickActionController! !

!IdeCodeGutterMorph methodsFor: 'event handling testing' stamp: 'GC 4/Apr/2026 04:00:25'!
handlesMouseDown: anEvent
	^ true! !

!IdeCodeGutterMorph methodsFor: 'events' stamp: 'GC 4/Apr/2026 05:29:54'!
mouseButton1Down: evt localPosition: localPosition
	(browserModel selectedMessageName isNil or: [ (self firstLineRectangle includesPoint: localPosition) not ]) ifTrue: [ ^ self ].
	localPosition x < 18 ifTrue: [ ^ self toggleBreakpoint ].
	(localPosition x < 36 and: [ self lightbulbActions isEmpty not ]) ifTrue: [ ^ self openQuickActionMenu ]! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:45:16'!
currentLineIndex
	| source upto |
	textPane ifNil: [ ^ 1 ].
	source := self currentSourceString.
	upto := ((textPane editor pointIndex max: 1) min: source size + 1) - 1.
	upto = 0 ifTrue: [ ^ 1 ].
	^ 1 + ((source copyFrom: 1 to: upto) lineCount - 1)! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
currentLineRectangle
	| lineTop |
	lineTop := self lineTopForIndex: self currentLineIndex.
	^ 0 @ lineTop extent: self morphWidth @ self lineHeight! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 04:00:25'!
drawBreakpointMarkerOn: aCanvas
	(self hasBreakpoint and: [ browserModel selectedMessageName notNil ]) ifFalse: [ ^ self ].
	aCanvas ellipseCenter: 9 @ self firstLineRectangle center y radius: 5@5 borderWidth: 1 borderColor: Color red muchDarker fillColor: Color red! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
drawCurrentLineHighlightOn: aCanvas
	browserModel selectedMessageName ifNil: [ ^ self ].
	aCanvas fillRectangle: self currentLineRectangle color: IdeEditorTheme gutterCurrentLineColor! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 20:10:00'!
drawLineNumbersOn: aCanvas
	| font visibleBottom currentLine baselineOffset |
	textPane ifNil: [ ^ self ].
	font := self lineNumberFont.
	visibleBottom := self morphHeight.
	currentLine := self currentLineIndex.
	baselineOffset := self lineBaselineOffset.
	1 to: self currentLineCount do: [:index | | drawY numberString drawX lineColor |
		drawY := self lineTopForIndex: index.
		(drawY + self lineHeight >= 0 and: [ drawY <= visibleBottom ]) ifTrue: [
			numberString := index printString.
			drawX := self morphWidth - (font widthOfString: numberString) - 6.
			lineColor := index = currentLine
				ifTrue: [ IdeEditorTheme activeLineNumberColor ]
				ifFalse: [ IdeEditorTheme lineNumberColor ].
			aCanvas
				drawString: numberString
				atBaseline: drawX @ (drawY + baselineOffset)
				font: font
				color: lineColor ]]! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
drawOn: aCanvas
	super drawOn: aCanvas.
	self drawCurrentLineHighlightOn: aCanvas.
	self drawSeparatorOn: aCanvas.
	self drawLineNumbersOn: aCanvas.
	self drawBreakpointMarkerOn: aCanvas.
	self drawQuickActionMarkerOn: aCanvas! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:29:54'!
drawQuickActionMarkerOn: aCanvas
	(self lightbulbActions isEmpty or: [ browserModel selectedMessageName isNil ]) ifTrue: [ ^ self ].
	aCanvas image: IdeQuickActionOverlayMorph iconForm at: 20 @ (self firstLineRectangle top + 1)! !

!IdeCodeGutterMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
drawSeparatorOn: aCanvas
	aCanvas fillRectangle: ((self morphWidth - 1) @ 0 extent: 1 @ self morphHeight) color: IdeEditorTheme separatorColor! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 04:00:25'!
currentActions
	^ quickActionController actionsFor: browserModel quickActionContext! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 04:40:37'!
currentLineCount
	| source |
	source := self currentSourceString.
	source isEmpty ifTrue: [ ^ 1 ].
	^ source lineCount! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 04:40:37'!
currentSourceString
	textPane ifNil: [ ^ '' ].
	^ textPane editor privateCurrentString! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 04:40:48'!
firstLineRectangle
	textPane ifNil: [ ^ 0@0 extent: self morphWidth @ 0 ].
	^ 0 @ (self lineTopForIndex: 1) extent: self morphWidth @ self lineHeight! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 04:00:25'!
hasBreakpoint
	browserModel selectedMessageName ifNil: [ ^ false ].
	^ (browserModel selectedClass >> browserModel selectedMessageName) hasBreakpoint! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:29:54'!
lightbulbActions
	^ quickActionController lightbulbActionsFor: browserModel quickActionContext! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:10:12'!
lineBaselineOffset
	| lines font |
	textPane ifNotNil: [
		lines := textPane innerTextMorph textComposition lines.
		lines isEmpty ifFalse: [ ^ lines first baseline ]].
	font := self lineNumberFont.
	^ font ascent + (((self lineHeight - font lineSpacing) max: 0) / 2)! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:02:13'!
lineHeight
	| lines font |
	textPane ifNotNil: [
		lines := textPane innerTextMorph textComposition lines.
		lines isEmpty ifFalse: [ ^ lines first lineHeight ]].
	font := self lineNumberFont.
	^ font lineSpacing! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 04:40:37'!
lineTopForIndex: anInteger
	| topInset offsetY |
	textPane ifNil: [ ^ 0 ].
	topInset := textPane viewableAreaTop.
	offsetY := textPane scrollerOffset y.
	^ topInset - offsetY + ((anInteger - 1) * self lineHeight)! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:29:54'!
openQuickActionMenu
	IdeQuickActionOverlayMorph openMenuForActions: self lightbulbActions near: self worldPosition + (36 @ self firstLineRectangle top)! !

!IdeCodeGutterMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 04:00:25'!
toggleBreakpoint
	| action |
	action := self currentActions detect: [:each | each id = #toggleBreakpoint ] ifNone: [ ^ self ].
	action perform.
	self redrawNeeded! !

!IdeCodeGutterMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 05:46:15'!
adoptWidgetsColor: paneColor
	super adoptWidgetsColor: paneColor.
	self color: IdeEditorTheme gutterBackgroundColor! !

!IdeCodeGutterMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 05:50:06'!
applyEditorTheme
	self color: IdeEditorTheme gutterBackgroundColor.
	self redrawNeeded! !

!IdeCodeGutterMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:02:13'!
lineNumberFont

	^ IdeEditorTheme codeFont! !

!IdeCodeGutterMorph methodsFor: 'geometry' stamp: 'GC 4/Apr/2026 20:05:04'!
preferredWidth
	| font widestLabel |
	font := self lineNumberFont.
	widestLabel := (self currentLineCount max: 1) printString.
	^ (font widthOfString: widestLabel) + 12! !

!IdeCodeGutterMorph class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 04:00:25'!
onTextPane: aTextPane model: aModel quickActionController: aQuickActionController
	^ self new
		textPane: aTextPane model: aModel quickActionController: aQuickActionController;
		yourself! !

!IdeCodePaneMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 05:44:54'!
initialize
	super initialize.
	self color: IdeEditorTheme editorBackgroundColor.
	self borderWidth: 1.
	self borderColor: IdeEditorTheme paneBorderColor! !

!IdeCodePaneMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 05:44:54'!
textPane: aTextPane model: aModel quickActionController: aQuickActionController
	textPane := aTextPane.
	textPane
		color: IdeEditorTheme editorBackgroundColor;
		borderWidth: 0;
		borderColor: Color transparent;
		setTextColor: IdeEditorTheme editorForegroundColor.
	browserModel := aModel.
	quickActionController := aQuickActionController.
	(textPane respondsTo: #codePane:) ifTrue: [ textPane codePane: self ].
	gutter := IdeCodeGutterMorph onTextPane: textPane model: browserModel quickActionController: quickActionController.
	quickActionOverlay := IdeQuickActionOverlayMorph model: browserModel quickActionController: quickActionController.
	self addMorph: gutter.
	self addMorph: textPane.
	self addMorph: quickActionOverlay.
	self startSteppingStepTime: self stepTime! !

!IdeCodePaneMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 05:46:15'!
adoptWidgetsColor: paneColor
	super adoptWidgetsColor: paneColor.
	self
		color: IdeEditorTheme editorBackgroundColor;
		borderColor: IdeEditorTheme paneBorderColor! !

!IdeCodePaneMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 05:50:06'!
applyEditorTheme
	self
		color: IdeEditorTheme editorBackgroundColor;
		borderColor: IdeEditorTheme paneBorderColor.
	gutter ifNotNil: [ gutter applyEditorTheme ].
	textPane ifNotNil: [ textPane applyEditorTheme ].
	self redrawNeeded! !

!IdeCodePaneMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 04:40:27'!
gutter
	^ gutter! !

!IdeCodePaneMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 04:00:25'!
textPane
	^ textPane! !

!IdeCodePaneMorph methodsFor: 'geometry' stamp: 'GC 4/Apr/2026 04:00:25'!
extentChanged: oldExtent
	super extentChanged: oldExtent.
	self layoutSubmorphs! !

!IdeCodePaneMorph methodsFor: 'geometry' stamp: 'GC 4/Apr/2026 20:04:50'!
gutterWidth
	^ gutter
		ifNil: [ 72 ]
		ifNotNil: [ gutter preferredWidth ]! !

!IdeCodePaneMorph methodsFor: 'geometry' stamp: 'GC 4/Apr/2026 04:00:25'!
layoutSubmorphs
	| gutterWidth overlayX overlayY |
	gutterWidth := self gutterWidth.
	gutter morphPosition: 0@0.
	gutter morphExtent: gutterWidth @ self morphHeight.
	textPane morphPosition: gutterWidth @ 0.
	textPane morphExtent: (self morphWidth - gutterWidth max: 10) @ self morphHeight.
	overlayX := gutterWidth + 6.
	overlayY := textPane viewableAreaTop + 4.
	quickActionOverlay morphPosition: overlayX @ overlayY! !

!IdeCodePaneMorph methodsFor: 'stepping' stamp: 'GC 4/Apr/2026 18:53:54'!
step

	(browserModel selectedMessageName notNil and: [ textPane editor hasSelection not ]) ifTrue: [
		(textPane innerTextMorph textComposition showTextCursor) ifFalse: [ textPane innerTextMorph startBlinking ]].
	self editorViewportPossiblyChanged.
	quickActionOverlay updateVisibility! !

!IdeCodePaneMorph methodsFor: 'stepping' stamp: 'GC 4/Apr/2026 04:00:25'!
stepTime
	^ 250! !

!IdeCodePaneMorph methodsFor: 'quick actions' stamp: 'GC 4/Apr/2026 04:00:25'!
currentActions
	^ quickActionController actionsFor: browserModel quickActionContext! !

!IdeCodePaneMorph methodsFor: 'quick actions' stamp: 'GC 4/Apr/2026 04:00:25'!
openQuickActionMenu
	quickActionOverlay openQuickActionMenu! !

!IdeCodePaneMorph methodsFor: 'updating' stamp: 'GC 4/Apr/2026 18:53:54'!
editorContentsPossiblyChanged

	self editorViewportPossiblyChanged.
	quickActionOverlay updateVisibility.
	quickActionOverlay redrawNeeded.
	self redrawNeeded! !

!IdeCodePaneMorph methodsFor: 'updating' stamp: 'GC 4/Apr/2026 18:53:54'!
editorViewportPossiblyChanged

	self layoutSubmorphs.
	gutter redrawNeeded! !

!IdeCodePaneMorph class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 04:00:25'!
onTextPane: aTextPane model: aModel quickActionController: aQuickActionController
	^ self new
		textPane: aTextPane model: aModel quickActionController: aQuickActionController;
		yourself! !

!IdeQuickActionOverlayMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 04:59:35'!
initialize
	super initialize.
	self visible: false! !

!IdeQuickActionOverlayMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 04:00:26'!
model: aModel quickActionController: aQuickActionController
	browserModel := aModel.
	quickActionController := aQuickActionController! !

!IdeQuickActionOverlayMorph methodsFor: 'event handling testing' stamp: 'GC 4/Apr/2026 04:00:26'!
handlesMouseDown: anEvent
	^ true! !

!IdeQuickActionOverlayMorph methodsFor: 'events' stamp: 'GC 4/Apr/2026 04:00:26'!
mouseButton1Down: evt localPosition: localPosition
	self openQuickActionMenu! !

!IdeQuickActionOverlayMorph methodsFor: 'quick actions' stamp: 'GC 4/Apr/2026 04:00:26'!
currentActions
	^ quickActionController actionsFor: browserModel quickActionContext! !

!IdeQuickActionOverlayMorph methodsFor: 'quick actions' stamp: 'GC 4/Apr/2026 05:29:54'!
lightbulbActions
	^ quickActionController lightbulbActionsFor: browserModel quickActionContext! !

!IdeQuickActionOverlayMorph methodsFor: 'quick actions' stamp: 'GC 4/Apr/2026 05:29:54'!
openQuickActionMenu
	self class openMenuForActions: self lightbulbActions near: self worldPosition + (0 @ self morphHeight)! !

!IdeQuickActionOverlayMorph methodsFor: 'updating' stamp: 'GC 4/Apr/2026 05:29:54'!
updateVisibility
	(self lightbulbActions isEmpty or: [ browserModel selectedMessageName isNil ])
		ifTrue: [ self hide ]
		ifFalse: [ self show ]! !

!IdeQuickActionOverlayMorph class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 04:58:57'!
iconForm
	| form canvas |
	form := Form extent: 14@14 depth: 32.
	canvas := form getCanvas.
	canvas fillRectangle: (0@0 extent: form extent) color: Color transparent.
	canvas ellipseCenter: 7@5 radius: 4@4 borderWidth: 1 borderColor: Color black fillColor: (Color r: 0.98 g: 0.84 b: 0.18).
	canvas fillRectangle: (5@10 extent: 4@2) color: Color black.
	^ form! !

!IdeQuickActionOverlayMorph class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 04:00:26'!
model: aModel quickActionController: aQuickActionController
	^ self new
		model: aModel quickActionController: aQuickActionController;
		yourself! !

!IdeQuickActionOverlayMorph class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 04:59:35'!
new
	^ super new
		image: self iconForm;
		yourself! !

!IdeQuickActionOverlayMorph class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 05:29:54'!
openMenuFor: aQuickActionContext controller: aQuickActionController near: aPoint
	^ self openMenuForActions: (aQuickActionController actionsFor: aQuickActionContext) near: aPoint! !

!IdeQuickActionOverlayMorph class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 05:29:54'!
openMenuForActions: aCollection near: aPoint
	| menu |
	aCollection isEmpty ifTrue: [ ^ nil ].
	menu := MenuMorph entitled: 'Quick Actions'.
	aCollection do: [:each |
		menu add: each label target: each action: #perform ].
	menu morphPosition: aPoint.
	menu popUpInWorld.
	^ menu! !

!IdeCodeTextMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 05:46:15'!
adoptWidgetsColor: paneColor
	super adoptWidgetsColor: paneColor.
	self
		color: IdeEditorTheme editorBackgroundColor;
		borderColor: Color transparent.
	self setTextColor: IdeEditorTheme editorForegroundColor! !

!IdeCodeTextMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:02:13'!
applyEditorFont

	self text ifNotNil: [:text | text font: self editorFont ]! !

!IdeCodeTextMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:02:13'!
applyEditorTheme
	self
		color: IdeEditorTheme editorBackgroundColor;
		borderColor: Color transparent.
	self setTextColor: IdeEditorTheme editorForegroundColor.
	self updateActualContents.
	self innerTextMorph redrawNeeded.
	self redrawNeeded! !

!IdeCodeTextMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 04:44:28'!
codePane: aCodePane
	codePane := aCodePane! !

!IdeCodeTextMorph methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 20:02:13'!
editorFont

	^ IdeEditorTheme codeFont! !

!IdeCodeTextMorph methodsFor: 'notifications' stamp: 'GC 4/Apr/2026 04:44:28'!
possiblyChanged
	super possiblyChanged.
	codePane ifNotNil: [ codePane editorContentsPossiblyChanged ]! !

!IdeCodeTextMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 22:45:31'!
initialize

	super initialize.
	editorCommands := IdeEditorCommands onTextPane: self.
	self
		color: IdeEditorTheme editorBackgroundColor;
		borderWidth: 0;
		borderColor: Color transparent.
	self setTextColor: IdeEditorTheme editorForegroundColor! !

!IdeCodeTextMorph methodsFor: 'initialization' stamp: 'GC 4/Apr/2026 05:04:22'!
innerMorphClass
	^ IdeInnerTextMorph! !

!IdeCodeTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
wantsFrameAdornments
	^ false! !

!IdeCodeTextMorph methodsFor: 'geometry' stamp: 'GC 4/Apr/2026 20:26:36'!
scrollSelectionIntoView
	| delta targetRectangle caretBlock editor |
	delta := scroller morphPosition.
	editor := self editor.
	(editor hasSelection or: [ editor pointBlock isNil ]) ifTrue: [
		^ super scrollSelectionIntoView ].
	caretBlock := editor pointBlock.
	targetRectangle := (caretBlock left @ caretBlock top extent: 1 @ (caretBlock height max: 1)) translatedBy: delta.
	^ self scrollToShow: targetRectangle! !

!IdeCodeTextMorph methodsFor: 'geometry' stamp: 'GC 4/Apr/2026 18:53:54'!
scrollerOffset: newOffset

	super scrollerOffset: newOffset.
	codePane ifNotNil: [ codePane editorViewportPossiblyChanged ]! !

!IdeCodeTextMorph methodsFor: 'updating' stamp: 'GC 4/Apr/2026 20:02:13'!
updateActualContents

	self applyEditorFont.
	^ super updateActualContents! !

!IdeCodeTextMorph methodsFor: 'editing' stamp: 'GC 4/Apr/2026 22:45:31'!
handleShiftReturnEvent: aKeyboardEvent

	^ editorCommands handleShiftReturnEvent: aKeyboardEvent! !

!IdeNavigationWindow methodsFor: 'accessing' stamp: 'GC 4/Apr/2026 16:46:27'!
codePaneMorph
	^ codePaneMorph! !

!IdeNavigationWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 22:57:23'!
buildMorphicWindow

	| rootColumn |
	self assertCanBuildWindow.
	model addDependent: self.
	self useLinearLayout.
	self layoutMorph separation: 4.
	rootColumn := LayoutMorph newColumn.
	rootColumn separation: 4.
	rootColumn
		addMorph: self buildNavigationRow proportionalHeight: self navigationRowHeightProportion;
		addAdjusterAndMorph: (codePaneMorph := self createCodePaneMorph) proportionalHeight: 1.0 - self navigationRowHeightProportion.
	self layoutMorph addMorphUseAll: rootColumn.
	self setLabel: self windowLabel! !

!IdeNavigationWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 16:47:56'!
buildNavigationRow
	| columns topRow firstColumn |
	columns := self navigationColumnMorphsWithProportions.
	topRow := LayoutMorph newRow.
	topRow separation: 4.
	firstColumn := columns first.
	topRow addMorph: firstColumn first proportionalWidth: firstColumn second.
	columns allButFirst do: [:each |
		topRow addAdjusterAndMorph: each first proportionalWidth: each second].
	^ topRow! !

!IdeNavigationWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 16:46:27'!
createCodePaneMorph
	| textPane |
	textPane := IdeCodeTextMorph
		textProvider: model
		textGetter: #acceptedContents
		textSetter: #contents:notifying:
		selectionGetter: #contentsSelection.
	textPane
		emptyTextDisplayMessage: 'Smalltalk code (nothing selected?)';
		enableEditing;
		wrapFlag: false.
	^ IdeCodePaneMorph onTextPane: textPane model: model quickActionController: IdeQuickActionController default! !

!IdeNavigationWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 16:46:27'!
navigationColumnMorphsWithProportions
	self subclassResponsibility! !

!IdeNavigationWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 16:46:27'!
navigationRowHeightProportion
	^ 0.35! !

!IdeNavigationWindow methodsFor: 'GUI building' stamp: 'GC 4/Apr/2026 16:46:27'!
windowLabel
	self subclassResponsibility! !

!IdeNavigationWindow methodsFor: 'ui focus' stamp: 'GC 4/Apr/2026 16:46:27'!
focusCodePaneIfPossible
	UISupervisor whenUIinSafeState: [
		| hand |
		hand := UISupervisor ui ifNotNil: [:ui | ui activeHand ].
		hand ifNotNil: [ hand newKeyboardFocus: self codePaneMorph textPane innerTextMorph ] ]! !

!IdeNavigationWindow methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 22:57:23'!
buildOn: aModel

	self model: aModel.
	self buildMorphicWindow! !

!IdeNavigationWindow methodsFor: 'private' stamp: 'GC 4/Apr/2026 22:57:23'!
assertCanBuildWindow

	model ifNil: [ self error: self class name, ' requires a model before buildMorphicWindow' ].
	codePaneMorph ifNotNil: [ self error: self class name, ' is already built' ]! !

!IdeNavigationWindow class methodsFor: 'instance creation' stamp: 'GC 4/Apr/2026 22:57:23'!
on: aModel

	^ self new
		buildOn: aModel;
		yourself! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
caretColor
	^ IdeEditorTheme caretColor! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
currentLineHighlightColor
	^ IdeEditorTheme currentLineHighlightColor! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 20:14:42'!
currentLineRectangle
	| block line top bottom visibleWidth visibleLeft |
	block := self textComposition characterBlockForIndex: editor pointIndex.
	line := block textLine.
	top := line top.
	bottom := line bottom.
	visibleLeft := owner ifNil: [ 0 ] ifNotNil: [ owner scrollerOffset x ].
	visibleWidth := owner ifNil: [ extent x ] ifNotNil: [ owner viewableWidth ].
	^ visibleLeft @ top extent: visibleWidth @ ((bottom - top) max: 1)! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 21:12:06'!
currentWordOccurrenceColor
	^ self selectedWordOccurrenceColor! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 16:35:38'!
currentWordOccurrenceInterval
	^ self currentTokenInterval! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:16:01'!
drawCurrentLineHighlightOn: aCanvas
	self shouldDrawCurrentLineHighlight ifFalse: [ ^ self ].
	aCanvas fillRectangle: self currentLineRectangle color: self currentLineHighlightColor! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:04:22'!
drawIdeCaretOn: aCanvas
	| block x top bottom |
	self shouldDrawIdeCaret ifFalse: [ ^ self ].
	block := self textComposition characterBlockForIndex: editor pointIndex.
	x := block left.
	top := block top.
	bottom := block textLine bottom.
	aCanvas fillRectangle: (x @ top extent: 2 @ (bottom - top max: 1)) color: self caretColor! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 21:01:57'!
drawOn: aCanvas

	aCanvas fillRectangle: (0@0 extent: extent) color: IdeEditorTheme editorBackgroundColor.
	self drawCurrentLineHighlightOn: aCanvas.
	self drawSelectedWordOccurrencesOn: aCanvas.
	self withoutNativeTextCursorDo: [
		aCanvas
			drawTextComposition: self textComposition
			at: 0@0
			extent: extent
			color: color
			selectionColor: self selectionColor ].
	model actualContents isEmpty ifTrue: [
		owner
			valueOfProperty: #emptyTextDisplayMessage
			ifPresentDo: [:msg |
				aCanvas drawString: msg at: 0@0 font: nil color: Theme current textEmptyDisplayMessage ]].
	self drawIdeCaretOn: aCanvas! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 21:14:18'!
drawSelectedWordOccurrencesOn: aCanvas

	| currentInterval highlightColor |
	currentInterval := self currentWordOccurrenceInterval.
	highlightColor := self selectedWordOccurrenceColor.
	self selectedWordOccurrenceIntervals do: [:each | | rectangle |
		(editor hasSelection and: [ each = currentInterval ]) ifFalse: [
			rectangle := self wordOccurrenceRectangleFor: each.
			aCanvas fillRectangle: rectangle color: highlightColor ]]! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
focusedSelectionColor
	^ IdeEditorTheme focusedSelectionColor! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
selectedWordOccurrenceColor
	^ editor hasSelection
		ifTrue: [ IdeEditorTheme selectedOccurrenceColor ]
		ifFalse: [ IdeEditorTheme caretOccurrenceColor ]! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 20:45:08'!
selectedWordOccurrenceIntervals

	| token source intervals searchStart matchStart matchStop |
	token := self selectedTokenString.
	token ifNil: [ ^ #() ].
	source := self currentSourceString.
	intervals := OrderedCollection new.
	searchStart := 1.
	[
		matchStart := source findString: token startingAt: searchStart.
		matchStart = 0 ] whileFalse: [
			matchStop := matchStart + token size - 1.
			((self isIdentifierBoundaryAt: matchStart - 1 in: source)
				and: [ self isIdentifierBoundaryAt: matchStop + 1 in: source ]
				and: [ (self isIntervalInsideIgnoredSyntaxFrom: matchStart to: matchStop) not ]) ifTrue: [
					intervals add: (matchStart to: matchStop) ].
			searchStart := matchStart + token size ].
	^ intervals! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:34:56'!
selectedWordOccurrenceRectangles
	^ self selectedWordOccurrenceIntervals collect: [:each | self wordOccurrenceRectangleFor: each]! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 21:14:18'!
selectionColor
	^ self hasKeyboardFocus
		ifTrue: [ self focusedSelectionColor ]
		ifFalse: [ self unfocusedSelectionColor ]! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:26:21'!
shouldDrawCurrentLineHighlight
	^ self disablesEditing not! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 21:08:15'!
shouldDrawIdeCaret
	^ self disablesEditing not
		and: [ self textComposition showTextCursor ]! !

!IdeInnerTextMorph methodsFor: 'drawing' stamp: 'GC 4/Apr/2026 05:44:54'!
unfocusedSelectionColor
	^ IdeEditorTheme unfocusedSelectionColor! !

!IdeInnerTextMorph methodsFor: 'event handling' stamp: 'GC 4/Apr/2026 21:08:15'!
keyboardFocusChange: aBoolean
	"The message is sent to a morph when its keyboard focus changes.
	The given argument indicates that the receiver is gaining (versus losing) the keyboard focus.
	In this case, all we need to do is to redraw border feedback"
	aBoolean
		ifTrue: [
			"A hand is wanting to send us characters..."
			editor ifNil: [ self editor storeSelectionInComposition ] ]
		ifFalse: [ self stopBlinking ].

	self updateIdeCaretVisibility.

	(owner notNil and: [ owner drawsKeyboardFocusIndicator ])
		ifTrue: [ owner redrawNeeded ]
		ifFalse: [
			"Selection might be shown differently when focused"
			self textComposition selectionRects do: [ :r | self invalidateLocalRect: r ]].
	self redrawNeeded! !

!IdeInnerTextMorph methodsFor: 'event handling' stamp: 'GC 4/Apr/2026 22:45:31'!
processKeystrokeEvent: evt

	((evt shiftPressed and: [ evt isReturnKey ]) and: [ owner respondsTo: #handleShiftReturnEvent: ]) ifTrue: [
		self handleInteraction: [ owner handleShiftReturnEvent: evt ].
		^ self ].
	^ super processKeystrokeEvent: evt! !

!IdeInnerTextMorph methodsFor: 'blinking cursor' stamp: 'GC 4/Apr/2026 05:13:41'!
onBlinkCursor
	super onBlinkCursor.
	self redrawNeeded! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:34:56'!
currentSourceString
	^ model actualContents asString! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:38:43'!
currentTokenInterval
	editor hasSelection ifTrue: [ ^ self selectedTokenInterval ].
	^ self tokenIntervalUnderCursor! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:13:02'!
fit
	| newExtent newHeight newWidth oldExtent minimumWidth |
	(owner is: #ScrollPane) ifFalse: [
		^ self ].

	newWidth := extent x.
	wrapFlag ifFalse: [
		minimumWidth := owner viewableWidth max: 9.
		newWidth := (self textComposition usedWidth + 3) max: minimumWidth ].
	newHeight := self textComposition usedHeight max: FontFamily defaultLineSpacing + 2.
	newExtent := newWidth @ newHeight.
	extent = newExtent
		ifTrue: [ self redrawNeeded ]
		ifFalse: [
			oldExtent := extent.
			extent := newExtent.
			self extentChanged: oldExtent.
			owner ifNotNil: [ owner someSubmorphPositionOrExtentChanged ].
			self redrawNeeded ].

	owner innerHeight: newExtent y! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:45:08'!
ignoredSyntaxRanges

	| parser |
	self currentSourceString isEmpty ifTrue: [ ^ #() ].
	parser := SHParserST80 new.
	parser
		classOrMetaClass: self parserClassContext;
		source: self currentSourceString;
		parse.
	^ parser rangesWithoutExcessCode select: [:each |
		#(#comment #string #unfinishedComment #unfinishedString) includes: each rangeType ]! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:34:56'!
isIdentifierBoundaryAt: anIndex in: aString
	(anIndex between: 1 and: aString size) ifFalse: [ ^ true ].
	^ (self isIdentifierCharacter: (aString at: anIndex)) not! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:34:56'!
isIdentifierCharacter: aCharacter
	^ aCharacter isAlphaNumeric or: [ aCharacter = $_ or: [ aCharacter = $: ] ]! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:45:08'!
isIndexInsideIgnoredSyntax: anIndex

	^ self isIntervalInsideIgnoredSyntaxFrom: anIndex to: anIndex! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:45:08'!
isIntervalInsideIgnoredSyntaxFrom: startIndex to: stopIndex

	^ self ignoredSyntaxRanges anySatisfy: [:each |
		each start <= stopIndex and: [ startIndex <= each end ]]! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:45:08'!
parserClassContext

	^ (model respondsTo: #stylingClassContext)
		ifTrue: [ model stylingClassContext ]
		ifFalse: [
			(model respondsTo: #selectedClassOrMetaClass)
				ifTrue: [ model selectedClassOrMetaClass ]
				ifFalse: [ nil ]]! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:58:38'!
rectanglesForCursorRange: aCursorRange
	| startBlock stopBlock |
	startBlock := self textComposition characterBlockForIndex: aCursorRange startIndex.
	stopBlock := self textComposition characterBlockForIndex: aCursorRange stopIndex.
	^ self textComposition selectionRectsFrom: startBlock to: stopBlock! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:45:08'!
selectedTokenInterval

	| source start stopAfter |
	editor hasSelection ifFalse: [ ^ nil ].
	source := self currentSourceString.
	start := editor startIndex.
	stopAfter := editor stopIndex.
	(start < stopAfter and: [
		(self isIdentifierBoundaryAt: start - 1 in: source)
			and: [ self isIdentifierBoundaryAt: stopAfter in: source ]
			and: [ (self isIntervalInsideIgnoredSyntaxFrom: start to: stopAfter - 1) not ] ]) ifFalse: [ ^ nil ].
	^ start to: stopAfter - 1! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:38:43'!
selectedTokenString
	| interval source |
	interval := self currentTokenInterval.
	interval ifNil: [ ^ nil ].
	source := self currentSourceString.
	^ source copyFrom: interval first to: interval last! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 21:08:15'!
selectionChanged
	self textComposition selectionRects do: [ :r | self invalidateLocalRect: r ].
	self updateIdeCaretVisibility.
	self redrawNeeded! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 20:45:08'!
tokenIntervalUnderCursor

	| source point range |
	source := self currentSourceString.
	point := editor pointIndex.
	(point between: 1 and: source size) ifFalse: [ ^ nil ].
	(self isIndexInsideIgnoredSyntax: point) ifTrue: [ ^ nil ].
	(self isIdentifierCharacter: (source at: point)) ifFalse: [ ^ nil ].
	range := editor wordRangeIncluding: point.
	^ range first <= range last ifTrue: [ range ] ifFalse: [ nil ]! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 21:08:15'!
updateIdeCaretVisibility
	self disablesEditing
		ifTrue: [ ^ self stopBlinking ].
	(self hasKeyboardFocus or: [ self textComposition showTextCursor ])
		ifTrue: [ self startBlinking ]
		ifFalse: [ self stopBlinking ]! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 21:01:57'!
withoutNativeTextCursorDo: aBlock
	| wasShowingTextCursor |
	wasShowingTextCursor := self textComposition showTextCursor.
	(self shouldDrawIdeCaret and: [ wasShowingTextCursor ]) ifFalse: [ ^ aBlock value ].
	self textComposition showTextCursor: false.
	[ aBlock value ] ensure: [ self textComposition showTextCursor: wasShowingTextCursor ]! !

!IdeInnerTextMorph methodsFor: 'private' stamp: 'GC 4/Apr/2026 05:34:56'!
wordOccurrenceRectangleFor: anInterval
	| startBlock endBlock top bottom left right |
	startBlock := self textComposition characterBlockForIndex: anInterval first.
	endBlock := self textComposition characterBlockForIndex: anInterval last + 1.
	left := startBlock left.
	right := endBlock left max: left + 1.
	top := startBlock top.
	bottom := startBlock textLine bottom.
	^ left @ top extent: (right - left) @ (bottom - top max: 1)! !

!IdeInnerTextMorph methodsFor: 'events' stamp: 'GC 4/Apr/2026 06:17:56'!
handlesShiftReturnAsEditingCommand
	^ true! !

!IdeInnerTextMorph methodsFor: 'events' stamp: 'GC 4/Apr/2026 20:54:19'!
keyboardShortcut: aKeyboardEvent

	^ super keyboardShortcut: aKeyboardEvent! !

!IdeInnerTextMorph methodsFor: 'events' stamp: 'GC 4/Apr/2026 20:54:19'!
mouseButton1Down: evt localPosition: localPosition

	^ super mouseButton1Down: evt localPosition: localPosition! !

!KeyboardEvent methodsFor: '*CuisUI-IDE-Core' stamp: 'GC 4/Apr/2026 22:45:31'!
sendEventTo: aMorph

	"Event dispatch finished. Deliver us straight to aMorph for execution."

	keyEventType == #keystroke ifTrue: [
		((self shiftPressed and: [ self isReturnKey ]) and: [
			(aMorph respondsTo: #handlesShiftReturnAsEditingCommand) and: [ aMorph handlesShiftReturnAsEditingCommand ] ]) ifFalse: [
			(self shiftPressed and: [ self isReturnKey ]) ifTrue: [ 
				(Preferences at: #classFinder) value.
				self wasHandled: true.
				^ self ]].
		aMorph processKeystroke: self.
		^ self ].
	keyEventType == #keyDown ifTrue: [
		aMorph processKeyDown: self.
		^ self ].
	keyEventType == #keyUp ifTrue: [ 
		aMorph processKeyUp: self.
		^ self ]! !

!SmalltalkEditor methodsFor: '*CuisUI-IDE-Core' stamp: 'GC 11/Apr/2026 21:49:43'!
ideGoToDefinitionTarget

	| provider |
	provider := self codeProvider.
	(provider respondsTo: #isEditingMethod) ifFalse: [ ^ nil ].
	provider isEditingMethod ifFalse: [ ^ nil ].
	^ IdeGoToDefinitionAnalyzer
		selectorAndReceiverFor: self text asString
		index: self startIndex
		context: ((provider respondsTo: #selectedClassOrMetaClass)
			ifTrue: [ provider selectedClassOrMetaClass ]
			ifFalse: [ nil ])! !
