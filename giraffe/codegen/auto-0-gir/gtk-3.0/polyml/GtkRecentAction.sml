structure GtkRecentAction :>
  GTK_RECENT_ACTION
    where type 'a class = 'a GtkRecentActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_recent_action_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkActionClass.PolyML.cPtr
          )
      val newForManager_ =
        call (getSymbol "gtk_recent_action_new_for_manager")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GtkRecentManagerClass.PolyML.cOptPtr
             --> GtkActionClass.PolyML.cPtr
          )
      val getShowNumbers_ = call (getSymbol "gtk_recent_action_get_show_numbers") (GtkRecentActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setShowNumbers_ = call (getSymbol "gtk_recent_action_set_show_numbers") (GtkRecentActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkRecentActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkRecentChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkRecentActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun newForManager
      (
        name,
        label,
        tooltip,
        stockId,
        manager
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GtkRecentManagerClass.FFI.withOptPtr
         ---> GtkRecentActionClass.FFI.fromPtr true
      )
        newForManager_
        (
          name
           & label
           & tooltip
           & stockId
           & manager
        )
    fun getShowNumbers self = (GtkRecentActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowNumbers_ self
    fun setShowNumbers self showNumbers = (GtkRecentActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowNumbers_ (self & showNumbers)
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
