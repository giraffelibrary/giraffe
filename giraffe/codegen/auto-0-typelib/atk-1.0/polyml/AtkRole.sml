structure AtkRole :> ATK_ROLE =
  struct
    datatype enum =
      INVALID
    | ACCEL_LABEL
    | ALERT
    | ANIMATION
    | ARROW
    | CALENDAR
    | CANVAS
    | CHECK_BOX
    | CHECK_MENU_ITEM
    | COLOR_CHOOSER
    | COLUMN_HEADER
    | COMBO_BOX
    | DATE_EDITOR
    | DESKTOP_ICON
    | DESKTOP_FRAME
    | DIAL
    | DIALOG
    | DIRECTORY_PANE
    | DRAWING_AREA
    | FILE_CHOOSER
    | FILLER
    | FONT_CHOOSER
    | FRAME
    | GLASS_PANE
    | HTML_CONTAINER
    | ICON
    | IMAGE
    | INTERNAL_FRAME
    | LABEL
    | LAYERED_PANE
    | LIST
    | LIST_ITEM
    | MENU
    | MENU_BAR
    | MENU_ITEM
    | OPTION_PANE
    | PAGE_TAB
    | PAGE_TAB_LIST
    | PANEL
    | PASSWORD_TEXT
    | POPUP_MENU
    | PROGRESS_BAR
    | PUSH_BUTTON
    | RADIO_BUTTON
    | RADIO_MENU_ITEM
    | ROOT_PANE
    | ROW_HEADER
    | SCROLL_BAR
    | SCROLL_PANE
    | SEPARATOR
    | SLIDER
    | SPLIT_PANE
    | SPIN_BUTTON
    | STATUSBAR
    | TABLE
    | TABLE_CELL
    | TABLE_COLUMN_HEADER
    | TABLE_ROW_HEADER
    | TEAR_OFF_MENU_ITEM
    | TERMINAL
    | TEXT
    | TOGGLE_BUTTON
    | TOOL_BAR
    | TOOL_TIP
    | TREE
    | TREE_TABLE
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
    | DOCUMENT_FRAME
    | HEADING
    | PAGE
    | SECTION
    | REDUNDANT_OBJECT
    | FORM
    | LINK
    | INPUT_METHOD_WINDOW
    | TABLE_ROW
    | TREE_ITEM
    | DOCUMENT_SPREADSHEET
    | DOCUMENT_PRESENTATION
    | DOCUMENT_TEXT
    | DOCUMENT_WEB
    | DOCUMENT_EMAIL
    | COMMENT
    | LIST_BOX
    | GROUPING
    | IMAGE_MAP
    | NOTIFICATION
    | INFO_BAR
    | LAST_DEFINED
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | ACCEL_LABEL => 1
          | ALERT => 2
          | ANIMATION => 3
          | ARROW => 4
          | CALENDAR => 5
          | CANVAS => 6
          | CHECK_BOX => 7
          | CHECK_MENU_ITEM => 8
          | COLOR_CHOOSER => 9
          | COLUMN_HEADER => 10
          | COMBO_BOX => 11
          | DATE_EDITOR => 12
          | DESKTOP_ICON => 13
          | DESKTOP_FRAME => 14
          | DIAL => 15
          | DIALOG => 16
          | DIRECTORY_PANE => 17
          | DRAWING_AREA => 18
          | FILE_CHOOSER => 19
          | FILLER => 20
          | FONT_CHOOSER => 21
          | FRAME => 22
          | GLASS_PANE => 23
          | HTML_CONTAINER => 24
          | ICON => 25
          | IMAGE => 26
          | INTERNAL_FRAME => 27
          | LABEL => 28
          | LAYERED_PANE => 29
          | LIST => 30
          | LIST_ITEM => 31
          | MENU => 32
          | MENU_BAR => 33
          | MENU_ITEM => 34
          | OPTION_PANE => 35
          | PAGE_TAB => 36
          | PAGE_TAB_LIST => 37
          | PANEL => 38
          | PASSWORD_TEXT => 39
          | POPUP_MENU => 40
          | PROGRESS_BAR => 41
          | PUSH_BUTTON => 42
          | RADIO_BUTTON => 43
          | RADIO_MENU_ITEM => 44
          | ROOT_PANE => 45
          | ROW_HEADER => 46
          | SCROLL_BAR => 47
          | SCROLL_PANE => 48
          | SEPARATOR => 49
          | SLIDER => 50
          | SPLIT_PANE => 51
          | SPIN_BUTTON => 52
          | STATUSBAR => 53
          | TABLE => 54
          | TABLE_CELL => 55
          | TABLE_COLUMN_HEADER => 56
          | TABLE_ROW_HEADER => 57
          | TEAR_OFF_MENU_ITEM => 58
          | TERMINAL => 59
          | TEXT => 60
          | TOGGLE_BUTTON => 61
          | TOOL_BAR => 62
          | TOOL_TIP => 63
          | TREE => 64
          | TREE_TABLE => 65
          | UNKNOWN => 66
          | VIEWPORT => 67
          | WINDOW => 68
          | HEADER => 69
          | FOOTER => 70
          | PARAGRAPH => 71
          | RULER => 72
          | APPLICATION => 73
          | AUTOCOMPLETE => 74
          | EDITBAR => 75
          | EMBEDDED => 76
          | ENTRY => 77
          | CHART => 78
          | CAPTION => 79
          | DOCUMENT_FRAME => 80
          | HEADING => 81
          | PAGE => 82
          | SECTION => 83
          | REDUNDANT_OBJECT => 84
          | FORM => 85
          | LINK => 86
          | INPUT_METHOD_WINDOW => 87
          | TABLE_ROW => 88
          | TREE_ITEM => 89
          | DOCUMENT_SPREADSHEET => 90
          | DOCUMENT_PRESENTATION => 91
          | DOCUMENT_TEXT => 92
          | DOCUMENT_WEB => 93
          | DOCUMENT_EMAIL => 94
          | COMMENT => 95
          | LIST_BOX => 96
          | GROUPING => 97
          | IMAGE_MAP => 98
          | NOTIFICATION => 99
          | INFO_BAR => 100
          | LAST_DEFINED => 101
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => ACCEL_LABEL
          | 2 => ALERT
          | 3 => ANIMATION
          | 4 => ARROW
          | 5 => CALENDAR
          | 6 => CANVAS
          | 7 => CHECK_BOX
          | 8 => CHECK_MENU_ITEM
          | 9 => COLOR_CHOOSER
          | 10 => COLUMN_HEADER
          | 11 => COMBO_BOX
          | 12 => DATE_EDITOR
          | 13 => DESKTOP_ICON
          | 14 => DESKTOP_FRAME
          | 15 => DIAL
          | 16 => DIALOG
          | 17 => DIRECTORY_PANE
          | 18 => DRAWING_AREA
          | 19 => FILE_CHOOSER
          | 20 => FILLER
          | 21 => FONT_CHOOSER
          | 22 => FRAME
          | 23 => GLASS_PANE
          | 24 => HTML_CONTAINER
          | 25 => ICON
          | 26 => IMAGE
          | 27 => INTERNAL_FRAME
          | 28 => LABEL
          | 29 => LAYERED_PANE
          | 30 => LIST
          | 31 => LIST_ITEM
          | 32 => MENU
          | 33 => MENU_BAR
          | 34 => MENU_ITEM
          | 35 => OPTION_PANE
          | 36 => PAGE_TAB
          | 37 => PAGE_TAB_LIST
          | 38 => PANEL
          | 39 => PASSWORD_TEXT
          | 40 => POPUP_MENU
          | 41 => PROGRESS_BAR
          | 42 => PUSH_BUTTON
          | 43 => RADIO_BUTTON
          | 44 => RADIO_MENU_ITEM
          | 45 => ROOT_PANE
          | 46 => ROW_HEADER
          | 47 => SCROLL_BAR
          | 48 => SCROLL_PANE
          | 49 => SEPARATOR
          | 50 => SLIDER
          | 51 => SPLIT_PANE
          | 52 => SPIN_BUTTON
          | 53 => STATUSBAR
          | 54 => TABLE
          | 55 => TABLE_CELL
          | 56 => TABLE_COLUMN_HEADER
          | 57 => TABLE_ROW_HEADER
          | 58 => TEAR_OFF_MENU_ITEM
          | 59 => TERMINAL
          | 60 => TEXT
          | 61 => TOGGLE_BUTTON
          | 62 => TOOL_BAR
          | 63 => TOOL_TIP
          | 64 => TREE
          | 65 => TREE_TABLE
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
          | 80 => DOCUMENT_FRAME
          | 81 => HEADING
          | 82 => PAGE
          | 83 => SECTION
          | 84 => REDUNDANT_OBJECT
          | 85 => FORM
          | 86 => LINK
          | 87 => INPUT_METHOD_WINDOW
          | 88 => TABLE_ROW
          | 89 => TREE_ITEM
          | 90 => DOCUMENT_SPREADSHEET
          | 91 => DOCUMENT_PRESENTATION
          | 92 => DOCUMENT_TEXT
          | 93 => DOCUMENT_WEB
          | 94 => DOCUMENT_EMAIL
          | 95 => COMMENT
          | 96 => LIST_BOX
          | 97 => GROUPING
          | 98 => IMAGE_MAP
          | 99 => NOTIFICATION
          | 100 => INFO_BAR
          | 101 => LAST_DEFINED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_role_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    local
      open PolyMLFFI
    in
      val forName_ = call (getSymbol "atk_role_for_name") (Utf8.PolyML.cInPtr --> PolyML.cVal)
      val getLocalizedName_ = call (getSymbol "atk_role_get_localized_name") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "atk_role_get_name") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val register_ = call (getSymbol "atk_role_register") (Utf8.PolyML.cInPtr --> PolyML.cVal)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forName name = (Utf8.FFI.withPtr ---> FFI.fromVal) forName_ name
    fun getLocalizedName role = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getLocalizedName_ role
    fun getName role = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ role
    fun register name = (Utf8.FFI.withPtr ---> FFI.fromVal) register_ name
  end
