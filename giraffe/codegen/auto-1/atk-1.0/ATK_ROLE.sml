signature ATK_ROLE =
  sig
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
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    val forName : string -> t
    val getLocalizedName : t -> string
    val getName : t -> string
    val register : string -> t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end
