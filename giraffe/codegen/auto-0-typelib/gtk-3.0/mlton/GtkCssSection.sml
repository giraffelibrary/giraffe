structure GtkCssSection :>
  GTK_CSS_SECTION
    where type t = GtkCssSectionRecord.t
    where type css_section_type_t = GtkCssSectionType.t =
  struct
    val getType_ = _import "gtk_css_section_get_type" : unit -> GObjectType.FFI.val_;
    val getEndLine_ = _import "gtk_css_section_get_end_line" : GtkCssSectionRecord.FFI.non_opt GtkCssSectionRecord.FFI.p -> GUInt32.FFI.val_;
    val getEndPosition_ = _import "gtk_css_section_get_end_position" : GtkCssSectionRecord.FFI.non_opt GtkCssSectionRecord.FFI.p -> GUInt32.FFI.val_;
    val getFile_ = _import "gtk_css_section_get_file" : GtkCssSectionRecord.FFI.non_opt GtkCssSectionRecord.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val getParent_ = _import "gtk_css_section_get_parent" : GtkCssSectionRecord.FFI.non_opt GtkCssSectionRecord.FFI.p -> GtkCssSectionRecord.FFI.opt GtkCssSectionRecord.FFI.p;
    val getSectionType_ = _import "gtk_css_section_get_section_type" : GtkCssSectionRecord.FFI.non_opt GtkCssSectionRecord.FFI.p -> GtkCssSectionType.FFI.val_;
    val getStartLine_ = _import "gtk_css_section_get_start_line" : GtkCssSectionRecord.FFI.non_opt GtkCssSectionRecord.FFI.p -> GUInt32.FFI.val_;
    val getStartPosition_ = _import "gtk_css_section_get_start_position" : GtkCssSectionRecord.FFI.non_opt GtkCssSectionRecord.FFI.p -> GUInt32.FFI.val_;
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
