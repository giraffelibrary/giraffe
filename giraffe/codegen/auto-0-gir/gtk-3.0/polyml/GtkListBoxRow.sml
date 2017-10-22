structure GtkListBoxRow :>
  GTK_LIST_BOX_ROW
    where type 'a class = 'a GtkListBoxRowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_list_box_row_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_list_box_row_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val changed_ = call (getSymbol "gtk_list_box_row_changed") (GtkListBoxRowClass.PolyML.cPtr --> cVoid)
      val getActivatable_ = call (getSymbol "gtk_list_box_row_get_activatable") (GtkListBoxRowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHeader_ = call (getSymbol "gtk_list_box_row_get_header") (GtkListBoxRowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getIndex_ = call (getSymbol "gtk_list_box_row_get_index") (GtkListBoxRowClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSelectable_ = call (getSymbol "gtk_list_box_row_get_selectable") (GtkListBoxRowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isSelected_ = call (getSymbol "gtk_list_box_row_is_selected") (GtkListBoxRowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActivatable_ = call (getSymbol "gtk_list_box_row_set_activatable") (GtkListBoxRowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHeader_ = call (getSymbol "gtk_list_box_row_set_header") (GtkListBoxRowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setSelectable_ = call (getSymbol "gtk_list_box_row_set_selectable") (GtkListBoxRowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
    fun getHeader self = (GtkListBoxRowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getHeader_ self
    fun getIndex self = (GtkListBoxRowClass.FFI.withPtr ---> GInt.FFI.fromVal) getIndex_ self
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
          set = fn x => set "activatable" boolean x
        }
      val selectableProp =
        {
          get = fn x => get "selectable" boolean x,
          set = fn x => set "selectable" boolean x
        }
    end
  end
