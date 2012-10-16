structure AtkRole :>
  sig
    include ATK_ROLE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | ACCELLABEL
    | ALERT
    | ANIMATION
    | ARROW
    | CALENDAR
    | CANVAS
    | CHECKBOX
    | CHECKMENUITEM
    | COLORCHOOSER
    | COLUMNHEADER
    | COMBOBOX
    | DATEEDITOR
    | DESKTOPICON
    | DESKTOPFRAME
    | DIAL
    | DIALOG
    | DIRECTORYPANE
    | DRAWINGAREA
    | FILECHOOSER
    | FILLER
    | FONTCHOOSER
    | FRAME
    | GLASSPANE
    | HTMLCONTAINER
    | ICON
    | IMAGE
    | INTERNALFRAME
    | LABEL
    | LAYEREDPANE
    | LIST
    | LISTITEM
    | MENU
    | MENUBAR
    | MENUITEM
    | OPTIONPANE
    | PAGETAB
    | PAGETABLIST
    | PANEL
    | PASSWORDTEXT
    | POPUPMENU
    | PROGRESSBAR
    | PUSHBUTTON
    | RADIOBUTTON
    | RADIOMENUITEM
    | ROOTPANE
    | ROWHEADER
    | SCROLLBAR
    | SCROLLPANE
    | SEPARATOR
    | SLIDER
    | SPLITPANE
    | SPINBUTTON
    | STATUSBAR
    | TABLE
    | TABLECELL
    | TABLECOLUMNHEADER
    | TABLEROWHEADER
    | TEAROFFMENUITEM
    | TERMINAL
    | TEXT
    | TOGGLEBUTTON
    | TOOLBAR
    | TOOLTIP
    | TREE
    | TREETABLE
    | UNKNOWN
    | VIEWPORT
    | WINDOW
    | HEADER
    | FOOTER
    | PARAGRAPH
    | RULER
    | APPLICATION
    | AUTOCOMPLETE
    | EDITBAR
    | EMBEDDED
    | ENTRY
    | CHART
    | CAPTION
    | DOCUMENTFRAME
    | HEADING
    | PAGE
    | SECTION
    | REDUNDANTOBJECT
    | FORM
    | LINK
    | INPUTMETHODWINDOW
    | TABLEROW
    | TREEITEM
    | DOCUMENTSPREADSHEET
    | DOCUMENTPRESENTATION
    | DOCUMENTTEXT
    | DOCUMENTWEB
    | DOCUMENTEMAIL
    | COMMENT
    | LISTBOX
    | GROUPING
    | IMAGEMAP
    | NOTIFICATION
    | INFOBAR
    | LASTDEFINED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALID => f 0
          | ACCELLABEL => f 1
          | ALERT => f 2
          | ANIMATION => f 3
          | ARROW => f 4
          | CALENDAR => f 5
          | CANVAS => f 6
          | CHECKBOX => f 7
          | CHECKMENUITEM => f 8
          | COLORCHOOSER => f 9
          | COLUMNHEADER => f 10
          | COMBOBOX => f 11
          | DATEEDITOR => f 12
          | DESKTOPICON => f 13
          | DESKTOPFRAME => f 14
          | DIAL => f 15
          | DIALOG => f 16
          | DIRECTORYPANE => f 17
          | DRAWINGAREA => f 18
          | FILECHOOSER => f 19
          | FILLER => f 20
          | FONTCHOOSER => f 21
          | FRAME => f 22
          | GLASSPANE => f 23
          | HTMLCONTAINER => f 24
          | ICON => f 25
          | IMAGE => f 26
          | INTERNALFRAME => f 27
          | LABEL => f 28
          | LAYEREDPANE => f 29
          | LIST => f 30
          | LISTITEM => f 31
          | MENU => f 32
          | MENUBAR => f 33
          | MENUITEM => f 34
          | OPTIONPANE => f 35
          | PAGETAB => f 36
          | PAGETABLIST => f 37
          | PANEL => f 38
          | PASSWORDTEXT => f 39
          | POPUPMENU => f 40
          | PROGRESSBAR => f 41
          | PUSHBUTTON => f 42
          | RADIOBUTTON => f 43
          | RADIOMENUITEM => f 44
          | ROOTPANE => f 45
          | ROWHEADER => f 46
          | SCROLLBAR => f 47
          | SCROLLPANE => f 48
          | SEPARATOR => f 49
          | SLIDER => f 50
          | SPLITPANE => f 51
          | SPINBUTTON => f 52
          | STATUSBAR => f 53
          | TABLE => f 54
          | TABLECELL => f 55
          | TABLECOLUMNHEADER => f 56
          | TABLEROWHEADER => f 57
          | TEAROFFMENUITEM => f 58
          | TERMINAL => f 59
          | TEXT => f 60
          | TOGGLEBUTTON => f 61
          | TOOLBAR => f 62
          | TOOLTIP => f 63
          | TREE => f 64
          | TREETABLE => f 65
          | UNKNOWN => f 66
          | VIEWPORT => f 67
          | WINDOW => f 68
          | HEADER => f 69
          | FOOTER => f 70
          | PARAGRAPH => f 71
          | RULER => f 72
          | APPLICATION => f 73
          | AUTOCOMPLETE => f 74
          | EDITBAR => f 75
          | EMBEDDED => f 76
          | ENTRY => f 77
          | CHART => f 78
          | CAPTION => f 79
          | DOCUMENTFRAME => f 80
          | HEADING => f 81
          | PAGE => f 82
          | SECTION => f 83
          | REDUNDANTOBJECT => f 84
          | FORM => f 85
          | LINK => f 86
          | INPUTMETHODWINDOW => f 87
          | TABLEROW => f 88
          | TREEITEM => f 89
          | DOCUMENTSPREADSHEET => f 90
          | DOCUMENTPRESENTATION => f 91
          | DOCUMENTTEXT => f 92
          | DOCUMENTWEB => f 93
          | DOCUMENTEMAIL => f 94
          | COMMENT => f 95
          | LISTBOX => f 96
          | GROUPING => f 97
          | IMAGEMAP => f 98
          | NOTIFICATION => f 99
          | INFOBAR => f 100
          | LASTDEFINED => f 101
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => ACCELLABEL
          | 2 => ALERT
          | 3 => ANIMATION
          | 4 => ARROW
          | 5 => CALENDAR
          | 6 => CANVAS
          | 7 => CHECKBOX
          | 8 => CHECKMENUITEM
          | 9 => COLORCHOOSER
          | 10 => COLUMNHEADER
          | 11 => COMBOBOX
          | 12 => DATEEDITOR
          | 13 => DESKTOPICON
          | 14 => DESKTOPFRAME
          | 15 => DIAL
          | 16 => DIALOG
          | 17 => DIRECTORYPANE
          | 18 => DRAWINGAREA
          | 19 => FILECHOOSER
          | 20 => FILLER
          | 21 => FONTCHOOSER
          | 22 => FRAME
          | 23 => GLASSPANE
          | 24 => HTMLCONTAINER
          | 25 => ICON
          | 26 => IMAGE
          | 27 => INTERNALFRAME
          | 28 => LABEL
          | 29 => LAYEREDPANE
          | 30 => LIST
          | 31 => LISTITEM
          | 32 => MENU
          | 33 => MENUBAR
          | 34 => MENUITEM
          | 35 => OPTIONPANE
          | 36 => PAGETAB
          | 37 => PAGETABLIST
          | 38 => PANEL
          | 39 => PASSWORDTEXT
          | 40 => POPUPMENU
          | 41 => PROGRESSBAR
          | 42 => PUSHBUTTON
          | 43 => RADIOBUTTON
          | 44 => RADIOMENUITEM
          | 45 => ROOTPANE
          | 46 => ROWHEADER
          | 47 => SCROLLBAR
          | 48 => SCROLLPANE
          | 49 => SEPARATOR
          | 50 => SLIDER
          | 51 => SPLITPANE
          | 52 => SPINBUTTON
          | 53 => STATUSBAR
          | 54 => TABLE
          | 55 => TABLECELL
          | 56 => TABLECOLUMNHEADER
          | 57 => TABLEROWHEADER
          | 58 => TEAROFFMENUITEM
          | 59 => TERMINAL
          | 60 => TEXT
          | 61 => TOGGLEBUTTON
          | 62 => TOOLBAR
          | 63 => TOOLTIP
          | 64 => TREE
          | 65 => TREETABLE
          | 66 => UNKNOWN
          | 67 => VIEWPORT
          | 68 => WINDOW
          | 69 => HEADER
          | 70 => FOOTER
          | 71 => PARAGRAPH
          | 72 => RULER
          | 73 => APPLICATION
          | 74 => AUTOCOMPLETE
          | 75 => EDITBAR
          | 76 => EMBEDDED
          | 77 => ENTRY
          | 78 => CHART
          | 79 => CAPTION
          | 80 => DOCUMENTFRAME
          | 81 => HEADING
          | 82 => PAGE
          | 83 => SECTION
          | 84 => REDUNDANTOBJECT
          | 85 => FORM
          | 86 => LINK
          | 87 => INPUTMETHODWINDOW
          | 88 => TABLEROW
          | 89 => TREEITEM
          | 90 => DOCUMENTSPREADSHEET
          | 91 => DOCUMENTPRESENTATION
          | 92 => DOCUMENTTEXT
          | 93 => DOCUMENTWEB
          | 94 => DOCUMENTEMAIL
          | 95 => COMMENT
          | 96 => LISTBOX
          | 97 => GROUPING
          | 98 => IMAGEMAP
          | 99 => NOTIFICATION
          | 100 => INFOBAR
          | 101 => LASTDEFINED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_role_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INVALID
    local
      open PolyMLFFI
    in
      val forName_ = call (load_sym libatk "atk_role_for_name") (FFI.PolyML.String.INPTR --> PolyML.VAL)
      val getLocalizedName_ = call (load_sym libatk "atk_role_get_localized_name") (PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val getName_ = call (load_sym libatk "atk_role_get_name") (PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val register_ = call (load_sym libatk "atk_role_register") (FFI.PolyML.String.INPTR --> PolyML.VAL)
    end
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.withConstPtr ---> C.fromVal) forName_ name
    fun getLocalizedName role = (C.withVal ---> FFI.String.fromPtr false) getLocalizedName_ role
    fun getName role = (C.withVal ---> FFI.String.fromPtr false) getName_ role
    fun register name = (FFI.String.withConstPtr ---> C.fromVal) register_ name
  end
