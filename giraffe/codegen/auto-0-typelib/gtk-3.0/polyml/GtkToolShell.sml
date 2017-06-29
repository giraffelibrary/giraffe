structure GtkToolShell :>
  GTK_TOOL_SHELL
    where type 'a class = 'a GtkToolShellClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type toolbar_style_t = GtkToolbarStyle.t
    where type orientation_t = GtkOrientation.t
    where type 'a size_group_class = 'a GtkSizeGroupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tool_shell_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getEllipsizeMode_ = call (getSymbol "gtk_tool_shell_get_ellipsize_mode") (GtkToolShellClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getIconSize_ = call (getSymbol "gtk_tool_shell_get_icon_size") (GtkToolShellClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getOrientation_ = call (getSymbol "gtk_tool_shell_get_orientation") (GtkToolShellClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getReliefStyle_ = call (getSymbol "gtk_tool_shell_get_relief_style") (GtkToolShellClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getStyle_ = call (getSymbol "gtk_tool_shell_get_style") (GtkToolShellClass.PolyML.cPtr --> GtkToolbarStyle.PolyML.cVal)
      val getTextAlignment_ = call (getSymbol "gtk_tool_shell_get_text_alignment") (GtkToolShellClass.PolyML.cPtr --> GFloat.PolyML.cVal)
      val getTextOrientation_ = call (getSymbol "gtk_tool_shell_get_text_orientation") (GtkToolShellClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getTextSizeGroup_ = call (getSymbol "gtk_tool_shell_get_text_size_group") (GtkToolShellClass.PolyML.cPtr --> GtkSizeGroupClass.PolyML.cPtr)
      val rebuildMenu_ = call (getSymbol "gtk_tool_shell_rebuild_menu") (GtkToolShellClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkToolShellClass.class
    type relief_style_t = GtkReliefStyle.t
    type toolbar_style_t = GtkToolbarStyle.t
    type orientation_t = GtkOrientation.t
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getEllipsizeMode self = (GtkToolShellClass.FFI.withPtr ---> PangoEllipsizeMode.FFI.fromVal) getEllipsizeMode_ self
    fun getIconSize self = (GtkToolShellClass.FFI.withPtr ---> GInt32.FFI.fromVal) getIconSize_ self
    fun getOrientation self = (GtkToolShellClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun getReliefStyle self = (GtkToolShellClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getReliefStyle_ self
    fun getStyle self = (GtkToolShellClass.FFI.withPtr ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun getTextAlignment self = (GtkToolShellClass.FFI.withPtr ---> GFloat.FFI.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GtkToolShellClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GtkToolShellClass.FFI.withPtr ---> GtkSizeGroupClass.FFI.fromPtr false) getTextSizeGroup_ self
    fun rebuildMenu self = (GtkToolShellClass.FFI.withPtr ---> I) rebuildMenu_ self
  end
