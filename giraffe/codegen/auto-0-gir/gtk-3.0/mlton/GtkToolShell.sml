structure GtkToolShell :>
  GTK_TOOL_SHELL
    where type 'a class = 'a GtkToolShellClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type toolbar_style_t = GtkToolbarStyle.t
    where type orientation_t = GtkOrientation.t
    where type 'a size_group_class = 'a GtkSizeGroupClass.class =
  struct
    val getType_ = _import "gtk_tool_shell_get_type" : unit -> GObjectType.FFI.val_;
    val getEllipsizeMode_ = _import "gtk_tool_shell_get_ellipsize_mode" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> PangoEllipsizeMode.FFI.val_;
    val getIconSize_ = _import "gtk_tool_shell_get_icon_size" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> GInt.FFI.val_;
    val getOrientation_ = _import "gtk_tool_shell_get_orientation" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> GtkOrientation.FFI.val_;
    val getReliefStyle_ = _import "gtk_tool_shell_get_relief_style" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> GtkReliefStyle.FFI.val_;
    val getStyle_ = _import "gtk_tool_shell_get_style" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> GtkToolbarStyle.FFI.val_;
    val getTextAlignment_ = _import "gtk_tool_shell_get_text_alignment" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> GFloat.FFI.val_;
    val getTextOrientation_ = _import "gtk_tool_shell_get_text_orientation" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> GtkOrientation.FFI.val_;
    val getTextSizeGroup_ = _import "gtk_tool_shell_get_text_size_group" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> GtkSizeGroupClass.FFI.non_opt GtkSizeGroupClass.FFI.p;
    val rebuildMenu_ = _import "gtk_tool_shell_rebuild_menu" : GtkToolShellClass.FFI.non_opt GtkToolShellClass.FFI.p -> unit;
    type 'a class = 'a GtkToolShellClass.class
    type relief_style_t = GtkReliefStyle.t
    type toolbar_style_t = GtkToolbarStyle.t
    type orientation_t = GtkOrientation.t
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getEllipsizeMode self = (GtkToolShellClass.FFI.withPtr false ---> PangoEllipsizeMode.FFI.fromVal) getEllipsizeMode_ self
    fun getIconSize self = (GtkToolShellClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIconSize_ self
    fun getOrientation self = (GtkToolShellClass.FFI.withPtr false ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun getReliefStyle self = (GtkToolShellClass.FFI.withPtr false ---> GtkReliefStyle.FFI.fromVal) getReliefStyle_ self
    fun getStyle self = (GtkToolShellClass.FFI.withPtr false ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun getTextAlignment self = (GtkToolShellClass.FFI.withPtr false ---> GFloat.FFI.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GtkToolShellClass.FFI.withPtr false ---> GtkOrientation.FFI.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GtkToolShellClass.FFI.withPtr false ---> GtkSizeGroupClass.FFI.fromPtr false) getTextSizeGroup_ self before GtkToolShellClass.FFI.touchPtr self
    fun rebuildMenu self = (GtkToolShellClass.FFI.withPtr false ---> I) rebuildMenu_ self
  end
