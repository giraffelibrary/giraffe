structure GtkCheckMenuItem :>
  GTK_CHECK_MENU_ITEM
    where type 'a class = 'a GtkCheckMenuItemClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
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
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCheckMenuItemClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr 0 ---> GtkCheckMenuItemClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr 0 ---> GtkCheckMenuItemClass.FFI.fromPtr false) newWithMnemonic_ label
    fun getActive self = (GtkCheckMenuItemClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActive_ self
    fun getDrawAsRadio self = (GtkCheckMenuItemClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDrawAsRadio_ self
    fun getInconsistent self = (GtkCheckMenuItemClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInconsistent_ self
    fun setActive self isActive = (GtkCheckMenuItemClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GtkCheckMenuItemClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
    fun setInconsistent self setting = (GtkCheckMenuItemClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInconsistent_ (self & setting)
    fun toggled self = (GtkCheckMenuItemClass.FFI.withPtr false ---> I) toggled_ self
    local
      open ClosureMarshal Signal
    in
      fun toggledSig f = signal "toggled" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val drawAsRadioProp =
        {
          name = "draw-as-radio",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val inconsistentProp =
        {
          name = "inconsistent",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
