structure GtkBin :>
  GTK_BIN
    where type 'a class = 'a GtkBinClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_bin_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getChild_ = call (load_sym libgtk "gtk_bin_get_child") (GtkBinClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkBinClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getChild self = (GtkBinClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getChild_ self
  end
