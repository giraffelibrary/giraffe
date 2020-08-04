structure GtkCssSection :>
  GTK_CSS_SECTION
    where type t = GtkCssSectionRecord.t
    where type css_section_type_t = GtkCssSectionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_css_section_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getEndLine_ = call (getSymbol "gtk_css_section_get_end_line") (GtkCssSectionRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getEndPosition_ = call (getSymbol "gtk_css_section_get_end_position") (GtkCssSectionRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getFile_ = call (getSymbol "gtk_css_section_get_file") (GtkCssSectionRecord.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getParent_ = call (getSymbol "gtk_css_section_get_parent") (GtkCssSectionRecord.PolyML.cPtr --> GtkCssSectionRecord.PolyML.cOptPtr)
      val getSectionType_ = call (getSymbol "gtk_css_section_get_section_type") (GtkCssSectionRecord.PolyML.cPtr --> GtkCssSectionType.PolyML.cVal)
      val getStartLine_ = call (getSymbol "gtk_css_section_get_start_line") (GtkCssSectionRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getStartPosition_ = call (getSymbol "gtk_css_section_get_start_position") (GtkCssSectionRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
    end
    type t = GtkCssSectionRecord.t
    type css_section_type_t = GtkCssSectionType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getEndLine self = (GtkCssSectionRecord.FFI.withPtr false ---> GUInt32.FFI.fromVal) getEndLine_ self
    fun getEndPosition self = (GtkCssSectionRecord.FFI.withPtr false ---> GUInt32.FFI.fromVal) getEndPosition_ self
    fun getFile self = (GtkCssSectionRecord.FFI.withPtr false ---> GioFileClass.FFI.fromPtr false) getFile_ self
    fun getParent self = (GtkCssSectionRecord.FFI.withPtr false ---> GtkCssSectionRecord.FFI.fromOptPtr false) getParent_ self
    fun getSectionType self = (GtkCssSectionRecord.FFI.withPtr false ---> GtkCssSectionType.FFI.fromVal) getSectionType_ self
    fun getStartLine self = (GtkCssSectionRecord.FFI.withPtr false ---> GUInt32.FFI.fromVal) getStartLine_ self
    fun getStartPosition self = (GtkCssSectionRecord.FFI.withPtr false ---> GUInt32.FFI.fromVal) getStartPosition_ self
  end
