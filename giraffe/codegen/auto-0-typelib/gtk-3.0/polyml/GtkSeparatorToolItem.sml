structure GtkSeparatorToolItem :>
  GTK_SEPARATOR_TOOL_ITEM
    where type 'a class_t = 'a GtkSeparatorToolItemClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_separator_tool_item_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_separator_tool_item_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getDraw_ = call (load_sym libgtk "gtk_separator_tool_item_get_draw") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setDraw_ = call (load_sym libgtk "gtk_separator_tool_item_set_draw") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkSeparatorToolItemClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSeparatorToolItemClass.C.fromPtr false) new_ ()
    fun getDraw self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDraw_ self
    fun setDraw self draw = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDraw_ (self & draw)
    local
      open Property
    in
      val drawProp =
        {
          get = fn x => get "draw" boolean x,
          set = fn x => set "draw" boolean x
        }
    end
  end
