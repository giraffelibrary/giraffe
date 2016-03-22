structure GtkSeparatorToolItem :>
  GTK_SEPARATOR_TOOL_ITEM
    where type 'a class = 'a GtkSeparatorToolItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_separator_tool_item_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_separator_tool_item_new" : unit -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
    val getDraw_ = _import "gtk_separator_tool_item_get_draw" : GtkSeparatorToolItemClass.C.notnull GtkSeparatorToolItemClass.C.p -> FFI.Bool.C.val_;
    val setDraw_ = fn x1 & x2 => (_import "gtk_separator_tool_item_set_draw" : GtkSeparatorToolItemClass.C.notnull GtkSeparatorToolItemClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSeparatorToolItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSeparatorToolItemClass.C.fromPtr false) new_ ()
    fun getDraw self = (GtkSeparatorToolItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getDraw_ self
    fun setDraw self draw = (GtkSeparatorToolItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDraw_ (self & draw)
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
