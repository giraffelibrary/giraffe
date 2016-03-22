structure GtkRecentChooserMenu :>
  GTK_RECENT_CHOOSER_MENU
    where type 'a class = 'a GtkRecentChooserMenuClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class =
  struct
    val getType_ = _import "gtk_recent_chooser_menu_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_chooser_menu_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newForManager_ = _import "gtk_recent_chooser_menu_new_for_manager" : GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getShowNumbers_ = _import "gtk_recent_chooser_menu_get_show_numbers" : GtkRecentChooserMenuClass.C.notnull GtkRecentChooserMenuClass.C.p -> FFI.Bool.C.val_;
    val setShowNumbers_ = fn x1 & x2 => (_import "gtk_recent_chooser_menu_set_show_numbers" : GtkRecentChooserMenuClass.C.notnull GtkRecentChooserMenuClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkRecentChooserMenuClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserMenuClass.C.fromPtr false) new_ ()
    fun newForManager manager = (GtkRecentManagerClass.C.withPtr ---> GtkRecentChooserMenuClass.C.fromPtr false) newForManager_ manager
    fun getShowNumbers self = (GtkRecentChooserMenuClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowNumbers_ self
    fun setShowNumbers self showNumbers = (GtkRecentChooserMenuClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowNumbers_ (self & showNumbers)
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
