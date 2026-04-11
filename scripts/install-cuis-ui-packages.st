"Instala los packages principales de Cuis UI seleccionando el directorio del repo."

| ui repo packages |
ui := UIManager default.
repo := ui
	chooseDirectory: 'Elegí el directorio donde clonaste el repo de cuis-ui'
	default: DirectoryEntry currentDirectory.
repo ifNil: [ ^ self ].

packages := #(
	'CuisUI-IDE-Core.pck.st'
	'CuisUI-IDE-Browser.pck.st'
	'CuisUI-IDE-Tests.pck.st').

packages do: [:each |
	| file |
	file := repo // each.
	(file existsAsFile) ifFalse: [
		ui inform: each , ' no existe en ' , repo pathName.
		^ self ].
	Transcript
		show: 'Instalando ' , each , ' desde ' , file pathName;
		cr.
	CodePackageFile installPackage: file ].

ui inform: 'Se instalaron los packages de Cuis UI desde ' , repo pathName.
