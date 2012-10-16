structure GtkToolShell :>
  GTK_TOOL_SHELL
    where type 'a class_t = 'a GtkToolShellClass.t
    where type reliefstyle_t = GtkReliefStyle.t
    where type toolbarstyle_t = GtkToolbarStyle.t
    where type orientation_t = GtkOrientation.t
    where type 'a sizegroupclass_t = 'a GtkSizeGroupClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tool_shell_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getEllipsizeMode_ = call (load_sym libgtk "gtk_tool_shell_get_ellipsize_mode") (GObjectObjectClass.PolyML.PTR --> PangoEllipsizeMode.PolyML.VAL)
      val getIconSize_ = call (load_sym libgtk "gtk_tool_shell_get_icon_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getOrientation_ = call (load_sym libgtk "gtk_tool_shell_get_orientation") (GObjectObjectClass.PolyML.PTR --> GtkOrientation.PolyML.VAL)
      val getReliefStyle_ = call (load_sym libgtk "gtk_tool_shell_get_relief_style") (GObjectObjectClass.PolyML.PTR --> GtkReliefStyle.PolyML.VAL)
      val getStyle_ = call (load_sym libgtk "gtk_tool_shell_get_style") (GObjectObjectClass.PolyML.PTR --> GtkToolbarStyle.PolyML.VAL)
      val getTextAlignment_ = call (load_sym libgtk "gtk_tool_shell_get_text_alignment") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Float.VAL)
      val getTextOrientation_ = call (load_sym libgtk "gtk_tool_shell_get_text_orientation") (GObjectObjectClass.PolyML.PTR --> GtkOrientation.PolyML.VAL)
      val getTextSizeGroup_ = call (load_sym libgtk "gtk_tool_shell_get_text_size_group") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val rebuildMenu_ = call (load_sym libgtk "gtk_tool_shell_rebuild_menu") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkToolShellClass.t
    type reliefstyle_t = GtkReliefStyle.t
    type toolbarstyle_t = GtkToolbarStyle.t
    type orientation_t = GtkOrientation.t
    type 'a sizegroupclass_t = 'a GtkSizeGroupClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEllipsizeMode self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsizeMode_ self
    fun getIconSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getIconSize_ self
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getOrientation_ self
    fun getReliefStyle self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getStyle self = (GObjectObjectClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun getTextAlignment self = (GObjectObjectClass.C.withPtr ---> FFI.Float.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GObjectObjectClass.C.withPtr ---> GtkSizeGroupClass.C.fromPtr false) getTextSizeGroup_ self
    fun rebuildMenu self = (GObjectObjectClass.C.withPtr ---> I) rebuildMenu_ self
  end
