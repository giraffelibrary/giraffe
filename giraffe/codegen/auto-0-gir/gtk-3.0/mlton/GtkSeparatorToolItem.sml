structure GtkSeparatorToolItem :>
  GTK_SEPARATOR_TOOL_ITEM
    where type 'a class = 'a GtkSeparatorToolItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_separator_tool_item_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_separator_tool_item_new" : unit -> GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p;
    val getDraw_ = _import "gtk_separator_tool_item_get_draw" : GtkSeparatorToolItemClass.FFI.notnull GtkSeparatorToolItemClass.FFI.p -> GBool.FFI.val_;
    val setDraw_ = fn x1 & x2 => (_import "gtk_separator_tool_item_set_draw" : GtkSeparatorToolItemClass.FFI.notnull GtkSeparatorToolItemClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSeparatorToolItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSeparatorToolItemClass.FFI.fromPtr false) new_ ()
    fun getDraw self = (GtkSeparatorToolItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getDraw_ self
    fun setDraw self draw = (GtkSeparatorToolItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDraw_ (self & draw)
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
