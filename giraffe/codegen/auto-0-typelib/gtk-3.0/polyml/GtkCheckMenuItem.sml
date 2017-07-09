structure GtkCheckMenuItem :>
  GTK_CHECK_MENU_ITEM
    where type 'a class = 'a GtkCheckMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_check_menu_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_check_menu_item_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_check_menu_item_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_check_menu_item_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getActive_ = call (getSymbol "gtk_check_menu_item_get_active") (GtkCheckMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDrawAsRadio_ = call (getSymbol "gtk_check_menu_item_get_draw_as_radio") (GtkCheckMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInconsistent_ = call (getSymbol "gtk_check_menu_item_get_inconsistent") (GtkCheckMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActive_ = call (getSymbol "gtk_check_menu_item_set_active") (GtkCheckMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setDrawAsRadio_ = call (getSymbol "gtk_check_menu_item_set_draw_as_radio") (GtkCheckMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setInconsistent_ = call (getSymbol "gtk_check_menu_item_set_inconsistent") (GtkCheckMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val toggled_ = call (getSymbol "gtk_check_menu_item_toggled") (GtkCheckMenuItemClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkCheckMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCheckMenuItemClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkCheckMenuItemClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkCheckMenuItemClass.FFI.fromPtr false) newWithMnemonic_ label
    fun getActive self = (GtkCheckMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getActive_ self
    fun getDrawAsRadio self = (GtkCheckMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getDrawAsRadio_ self
    fun getInconsistent self = (GtkCheckMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getInconsistent_ self
    fun setActive self isActive = (GtkCheckMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GtkCheckMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
    fun setInconsistent self setting = (GtkCheckMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInconsistent_ (self & setting)
    fun toggled self = (GtkCheckMenuItemClass.FFI.withPtr ---> I) toggled_ self
    local
      open ClosureMarshal Signal
    in
      fun toggledSig f = signal "toggled" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
      val drawAsRadioProp =
        {
          get = fn x => get "draw-as-radio" boolean x,
          set = fn x => set "draw-as-radio" boolean x
        }
      val inconsistentProp =
        {
          get = fn x => get "inconsistent" boolean x,
          set = fn x => set "inconsistent" boolean x
        }
    end
  end
