structure GtkSeparatorToolItem :>
  GTK_SEPARATOR_TOOL_ITEM
    where type 'a class_t = 'a GtkSeparatorToolItemClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_separator_tool_item_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_separator_tool_item_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDraw_ = call (load_sym libgtk "gtk_separator_tool_item_get_draw") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setDraw_ = call (load_sym libgtk "gtk_separator_tool_item_set_draw") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSeparatorToolItemClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
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
