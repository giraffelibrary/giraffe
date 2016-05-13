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
      val getType_ = call (load_sym libgtk "gtk_tool_shell_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getEllipsizeMode_ = call (load_sym libgtk "gtk_tool_shell_get_ellipsize_mode") (GtkToolShellClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getIconSize_ = call (load_sym libgtk "gtk_tool_shell_get_icon_size") (GtkToolShellClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getOrientation_ = call (load_sym libgtk "gtk_tool_shell_get_orientation") (GtkToolShellClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getReliefStyle_ = call (load_sym libgtk "gtk_tool_shell_get_relief_style") (GtkToolShellClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getStyle_ = call (load_sym libgtk "gtk_tool_shell_get_style") (GtkToolShellClass.PolyML.cPtr --> GtkToolbarStyle.PolyML.cVal)
      val getTextAlignment_ = call (load_sym libgtk "gtk_tool_shell_get_text_alignment") (GtkToolShellClass.PolyML.cPtr --> FFI.Float.PolyML.cVal)
      val getTextOrientation_ = call (load_sym libgtk "gtk_tool_shell_get_text_orientation") (GtkToolShellClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getTextSizeGroup_ = call (load_sym libgtk "gtk_tool_shell_get_text_size_group") (GtkToolShellClass.PolyML.cPtr --> GtkSizeGroupClass.PolyML.cPtr)
      val rebuildMenu_ = call (load_sym libgtk "gtk_tool_shell_rebuild_menu") (GtkToolShellClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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
