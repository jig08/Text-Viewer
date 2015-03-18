as yet unclassified
initialize
	| font codeFont |
	"file := FileReference fileSystem: FileSystem memory path:'wqy-microhei.ttc'.
	face := FreeTypeFace fromFile: file index: 0."
	font := LogicalFont familyName: 'WenQuanYi Micro Hei' pointSize: 10 .
	codeFont := LogicalFont familyName: 'WenQuanYi Micro Hei Mono' pointSize: 10 .
	StandardFonts listFont: codeFont.
	StandardFonts menuFont: font.
	StandardFonts codeFont: codeFont.
	StandardFonts buttonFont: codeFont.
	StandardFonts defaultFont: font.
	StandardFonts windowTitleFont: font.
	
    "FreeTypeFontProvider current updateFromSystem."  
	
	ptm := PluggableTextMorph new.
	ptm extent: 650@450.
	ptm alwaysShowScrollBars: true.
	
	title := ImageMorph withForm: (Form fromFileNamed: FileSystem workingDirectory/'eye.gif').
	title position: 200@50.
	"title fromGIFFileNamed: 'eye.gif'."
	
	txtViewer := ptm textMorph.
	
	mnuTitles := MenuMorph  new.
	mnuTitles stayUp: true.
	
	Chapter clear.
	MyMenuItem clear.
	
	(Chapter new) title: 'WELCOME';content: 'Welcome to Text Viewer. Developed in Pharo 4.0.'.
	"(Chapter new) title: 'Chapter 2';content: 'Long Live Free software foundation!!'."
	((FileLocator workingDirectory / 'document') allFiles) sort do: [ :f|
		|d|
		d := Document new.
		d openWithFile: f.
		d title: (f basenameWithoutExtension ). ].
	Chapter allSubInstances size > 0 ifTrue: [
		1 to: (Chapter allSubInstances size) do: [ :index |
			|chapter item|
			chapter := Chapter at: index.
			item := MyMenuItem new chapter: chapter.
			mnuTitles addMenuItem: item.
		].
	].

	Document instances do: [ :chapter |
		|item|
		item := MyMenuItem new chapter: chapter.
		mnuTitles addMenuItem: item. ].
	
	mnuTitles position: 100@100.
	ptm position: 300@100.
	
	box := Morph new.
	box color: Color paleYellow .
	box extent: (World extent).
	box addMorph: ptm.
	box addMorph: mnuTitles.
	box addMorph: title .
	box openInWorld.