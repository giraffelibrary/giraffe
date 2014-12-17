structure GtkCheckMenuItem :>
  GTK_CHECK_MENU_ITEM
    where type 'a class_t = 'a GtkCheckMenuItemClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_check_menu_item_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_check_menu_item_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithLabel_ = call (load_sym libgtk "gtk_check_menu_item_new_with_label") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_check_menu_item_new_with_mnemonic") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getActive_ = call (load_sym libgtk "gtk_check_menu_item_get_active") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getDrawAsRadio_ = call (load_sym libgtk "gtk_check_menu_item_get_draw_as_radio") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getInconsistent_ = call (load_sym libgtk "gtk_check_menu_item_get_inconsistent") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setActive_ = call (load_sym libgtk "gtk_check_menu_item_set_active") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setDrawAsRadio_ = call (load_sym libgtk "gtk_check_menu_item_set_draw_as_radio") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setInconsistent_ = call (load_sym libgtk "gtk_check_menu_item_set_inconsistent") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val toggled_ = call (load_sym libgtk "gtk_check_menu_item_toggled") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCheckMenuItemClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCheckMenuItemClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (FFI.String.C.withConstPtr ---> GtkCheckMenuItemClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (FFI.String.C.withConstPtr ---> GtkCheckMenuItemClass.C.fromPtr false) newWithMnemonic_ label
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getActive_ self
    fun getDrawAsRadio self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawAsRadio_ self
    fun getInconsistent self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInconsistent_ self
    fun setActive self isActive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
    fun setInconsistent self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInconsistent_ (self & setting)
    fun toggled self = (GObjectObjectClass.C.withPtr ---> I) toggled_ self
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
