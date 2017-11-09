signature ATK_ROLE =
  sig
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
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
    val forName : string -> t
    val getLocalizedName : t -> string
    val getName : t -> string
    val register : string -> t
  end
