structure GtkRecentChooserMenu :>
  GTK_RECENT_CHOOSER_MENU
    where type 'a class = 'a GtkRecentChooserMenuClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_chooser_menu_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_recent_chooser_menu_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newForManager_ = call (getSymbol "gtk_recent_chooser_menu_new_for_manager") (GtkRecentManagerClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getShowNumbers_ = call (getSymbol "gtk_recent_chooser_menu_get_show_numbers") (GtkRecentChooserMenuClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setShowNumbers_ = call (getSymbol "gtk_recent_chooser_menu_set_show_numbers") (GtkRecentChooserMenuClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkRecentChooserMenuClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkRecentChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserMenuClass.FFI.fromPtr false) new_ ()
    fun newForManager manager = (GtkRecentManagerClass.FFI.withPtr ---> GtkRecentChooserMenuClass.FFI.fromPtr false) newForManager_ manager
    fun getShowNumbers self = (GtkRecentChooserMenuClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowNumbers_ self
    fun setShowNumbers self showNumbers = (GtkRecentChooserMenuClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowNumbers_ (self & showNumbers)
    local
      open Property
    in
      val showNumbersProp =
        {
          get = fn x => get "show-numbers" boolean x,
          set = fn x => set "show-numbers" boolean x,
          new = fn x => new "show-numbers" boolean x
        }
    end
  end
