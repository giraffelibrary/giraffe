structure GtkListBoxRow :>
  GTK_LIST_BOX_ROW
    where type 'a class = 'a GtkListBoxRowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_list_box_row_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_list_box_row_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val changed_ = _import "gtk_list_box_row_changed" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> unit;
    val getActivatable_ = _import "gtk_list_box_row_get_activatable" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> GBool.FFI.val_;
    val getHeader_ = _import "gtk_list_box_row_get_header" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getIndex_ = _import "gtk_list_box_row_get_index" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> GInt32.FFI.val_;
    val getSelectable_ = _import "gtk_list_box_row_get_selectable" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> GBool.FFI.val_;
    val isSelected_ = _import "gtk_list_box_row_is_selected" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> GBool.FFI.val_;
    val setActivatable_ = fn x1 & x2 => (_import "gtk_list_box_row_set_activatable" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHeader_ = fn x1 & x2 => (_import "gtk_list_box_row_set_header" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setSelectable_ = fn x1 & x2 => (_import "gtk_list_box_row_set_selectable" : GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkListBoxRowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkListBoxRowClass.FFI.fromPtr false) new_ ()
    fun changed self = (GtkListBoxRowClass.FFI.withPtr ---> I) changed_ self
    fun getActivatable self = (GtkListBoxRowClass.FFI.withPtr ---> GBool.FFI.fromVal) getActivatable_ self
    fun getHeader self = (GtkListBoxRowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getHeader_ self
    fun getIndex self = (GtkListBoxRowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getIndex_ self
    fun getSelectable self = (GtkListBoxRowClass.FFI.withPtr ---> GBool.FFI.fromVal) getSelectable_ self
    fun isSelected self = (GtkListBoxRowClass.FFI.withPtr ---> GBool.FFI.fromVal) isSelected_ self
    fun setActivatable self activatable = (GtkListBoxRowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActivatable_ (self & activatable)
    fun setHeader self header = (GtkListBoxRowClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setHeader_ (self & header)
    fun setSelectable self selectable = (GtkListBoxRowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSelectable_ (self & selectable)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activatableProp =
        {
          get = fn x => get "activatable" boolean x,
          set = fn x => set "activatable" boolean x,
          new = fn x => new "activatable" boolean x
        }
      val selectableProp =
        {
          get = fn x => get "selectable" boolean x,
          set = fn x => set "selectable" boolean x,
          new = fn x => new "selectable" boolean x
        }
    end
  end
