signature GTK_CSS_SECTION =
  sig
    type t
    type css_section_type_t
    val getType : unit -> GObject.Type.t
    val getEndLine : t -> LargeInt.int
    val getEndPosition : t -> LargeInt.int
    val getFile : t -> base Gio.FileClass.class
    val getParent : t -> t
    val getSectionType : t -> css_section_type_t
    val getStartLine : t -> LargeInt.int
    val getStartPosition : t -> LargeInt.int
  end
