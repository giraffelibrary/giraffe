structure GtkBin :>
  GTK_BIN
    where type 'a class = 'a GtkBinClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_bin_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getChild_ = call (getSymbol "gtk_bin_get_child") (GtkBinClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkBinClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getChild self = (GtkBinClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getChild_ self before GtkBinClass.FFI.touchPtr self
  end
