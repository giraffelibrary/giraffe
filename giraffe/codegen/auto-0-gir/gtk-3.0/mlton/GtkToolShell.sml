structure GtkToolShell :>
  GTK_TOOL_SHELL
    where type 'a class = 'a GtkToolShellClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type toolbar_style_t = GtkToolbarStyle.t
    where type orientation_t = GtkOrientation.t
    where type 'a size_group_class = 'a GtkSizeGroupClass.class =
  struct
    val getType_ = _import "gtk_tool_shell_get_type" : unit -> GObjectType.C.val_;
    val getEllipsizeMode_ = _import "gtk_tool_shell_get_ellipsize_mode" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> PangoEllipsizeMode.C.val_;
    val getIconSize_ = _import "gtk_tool_shell_get_icon_size" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> FFI.Int.C.val_;
    val getOrientation_ = _import "gtk_tool_shell_get_orientation" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> GtkOrientation.C.val_;
    val getReliefStyle_ = _import "gtk_tool_shell_get_relief_style" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> GtkReliefStyle.C.val_;
    val getStyle_ = _import "gtk_tool_shell_get_style" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> GtkToolbarStyle.C.val_;
    val getTextAlignment_ = _import "gtk_tool_shell_get_text_alignment" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> FFI.Float.C.val_;
    val getTextOrientation_ = _import "gtk_tool_shell_get_text_orientation" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> GtkOrientation.C.val_;
    val getTextSizeGroup_ = _import "gtk_tool_shell_get_text_size_group" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p;
    val rebuildMenu_ = _import "gtk_tool_shell_rebuild_menu" : GtkToolShellClass.C.notnull GtkToolShellClass.C.p -> unit;
    type 'a class = 'a GtkToolShellClass.class
    type relief_style_t = GtkReliefStyle.t
    type toolbar_style_t = GtkToolbarStyle.t
    type orientation_t = GtkOrientation.t
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEllipsizeMode self = (GtkToolShellClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsizeMode_ self
    fun getIconSize self = (GtkToolShellClass.C.withPtr ---> FFI.Int.C.fromVal) getIconSize_ self
    fun getOrientation self = (GtkToolShellClass.C.withPtr ---> GtkOrientation.C.fromVal) getOrientation_ self
    fun getReliefStyle self = (GtkToolShellClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getStyle self = (GtkToolShellClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun getTextAlignment self = (GtkToolShellClass.C.withPtr ---> FFI.Float.C.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GtkToolShellClass.C.withPtr ---> GtkOrientation.C.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GtkToolShellClass.C.withPtr ---> GtkSizeGroupClass.C.fromPtr false) getTextSizeGroup_ self
    fun rebuildMenu self = (GtkToolShellClass.C.withPtr ---> I) rebuildMenu_ self
  end
