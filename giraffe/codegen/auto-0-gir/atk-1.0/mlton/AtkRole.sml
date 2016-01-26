structure AtkRole :>
  sig
    include ATK_ROLE
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | ACCEL_LABEL => f 1
          | ALERT => f 2
          | ANIMATION => f 3
          | ARROW => f 4
          | CALENDAR => f 5
          | CANVAS => f 6
          | CHECK_BOX => f 7
          | CHECK_MENU_ITEM => f 8
          | COLOR_CHOOSER => f 9
          | COLUMN_HEADER => f 10
          | COMBO_BOX => f 11
          | DATE_EDITOR => f 12
          | DESKTOP_ICON => f 13
          | DESKTOP_FRAME => f 14
          | DIAL => f 15
          | DIALOG => f 16
          | DIRECTORY_PANE => f 17
          | DRAWING_AREA => f 18
          | FILE_CHOOSER => f 19
          | FILLER => f 20
          | FONT_CHOOSER => f 21
          | FRAME => f 22
          | GLASS_PANE => f 23
          | HTML_CONTAINER => f 24
          | ICON => f 25
          | IMAGE => f 26
          | INTERNAL_FRAME => f 27
          | LABEL => f 28
          | LAYERED_PANE => f 29
          | LIST => f 30
          | LIST_ITEM => f 31
          | MENU => f 32
          | MENU_BAR => f 33
          | MENU_ITEM => f 34
          | OPTION_PANE => f 35
          | PAGE_TAB => f 36
          | PAGE_TAB_LIST => f 37
          | PANEL => f 38
          | PASSWORD_TEXT => f 39
          | POPUP_MENU => f 40
          | PROGRESS_BAR => f 41
          | PUSH_BUTTON => f 42
          | RADIO_BUTTON => f 43
          | RADIO_MENU_ITEM => f 44
          | ROOT_PANE => f 45
          | ROW_HEADER => f 46
          | SCROLL_BAR => f 47
          | SCROLL_PANE => f 48
          | SEPARATOR => f 49
          | SLIDER => f 50
          | SPLIT_PANE => f 51
          | SPIN_BUTTON => f 52
          | STATUSBAR => f 53
          | TABLE => f 54
          | TABLE_CELL => f 55
          | TABLE_COLUMN_HEADER => f 56
          | TABLE_ROW_HEADER => f 57
          | TEAR_OFF_MENU_ITEM => f 58
          | TERMINAL => f 59
          | TEXT => f 60
          | TOGGLE_BUTTON => f 61
          | TOOL_BAR => f 62
          | TOOL_TIP => f 63
          | TREE => f 64
          | TREE_TABLE => f 65
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
          | DOCUMENT_FRAME => f 80
          | HEADING => f 81
          | PAGE => f 82
          | SECTION => f 83
          | REDUNDANT_OBJECT => f 84
          | FORM => f 85
          | LINK => f 86
          | INPUT_METHOD_WINDOW => f 87
          | TABLE_ROW => f 88
          | TREE_ITEM => f 89
          | DOCUMENT_SPREADSHEET => f 90
          | DOCUMENT_PRESENTATION => f 91
          | DOCUMENT_TEXT => f 92
          | DOCUMENT_WEB => f 93
          | DOCUMENT_EMAIL => f 94
          | COMMENT => f 95
          | LIST_BOX => f 96
          | GROUPING => f 97
          | IMAGE_MAP => f 98
          | NOTIFICATION => f 99
          | INFO_BAR => f 100
          | LAST_DEFINED => f 101
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    val getType_ = _import "atk_role_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INVALID
    val forName_ = _import "mlton_atk_role_for_name" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> C.val_;
    val getLocalizedName_ = _import "atk_role_get_localized_name" : C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val getName_ = _import "atk_role_get_name" : C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val register_ = _import "mlton_atk_role_register" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.C.withConstPtr ---> C.fromVal) forName_ name
    fun getLocalizedName role = (C.withVal ---> FFI.String.C.fromPtr false) getLocalizedName_ role
    fun getName role = (C.withVal ---> FFI.String.C.fromPtr false) getName_ role
    fun register name = (FFI.String.C.withConstPtr ---> C.fromVal) register_ name
  end
