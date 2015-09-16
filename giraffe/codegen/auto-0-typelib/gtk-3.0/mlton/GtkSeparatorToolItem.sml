structure GtkSeparatorToolItem :>
  GTK_SEPARATOR_TOOL_ITEM
    where type 'a class_t = 'a GtkSeparatorToolItemClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_separator_tool_item_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_separator_tool_item_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDraw_ = _import "gtk_separator_tool_item_get_draw" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setDraw_ = fn x1 & x2 => (_import "gtk_separator_tool_item_set_draw" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
