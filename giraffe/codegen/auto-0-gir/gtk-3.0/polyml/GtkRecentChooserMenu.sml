structure GtkRecentChooserMenu :>
  GTK_RECENT_CHOOSER_MENU
    where type 'a class_t = 'a GtkRecentChooserMenuClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a recent_chooser_class_t = 'a GtkRecentChooserClass.t
    where type 'a recent_manager_class_t = 'a GtkRecentManagerClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_chooser_menu_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_recent_chooser_menu_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newForManager_ = call (load_sym libgtk "gtk_recent_chooser_menu_new_for_manager") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getShowNumbers_ = call (load_sym libgtk "gtk_recent_chooser_menu_get_show_numbers") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setShowNumbers_ = call (load_sym libgtk "gtk_recent_chooser_menu_set_show_numbers") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkRecentChooserMenuClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a recent_chooser_class_t = 'a GtkRecentChooserClass.t
    type 'a recent_manager_class_t = 'a GtkRecentManagerClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserMenuClass.C.fromPtr false) new_ ()
    fun newForManager manager = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserMenuClass.C.fromPtr false) newForManager_ manager
    fun getShowNumbers self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowNumbers_ self
    fun setShowNumbers self showNumbers = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowNumbers_ (self & showNumbers)
    local
      open Property
    in
      val showNumbersProp =
        {
          get = fn x => get "show-numbers" boolean x,
          set = fn x => set "show-numbers" boolean x
        }
    end
  end
