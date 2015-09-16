structure GtkRecentAction :>
  GTK_RECENT_ACTION
    where type 'a class_t = 'a GtkRecentActionClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a recent_chooser_class_t = 'a GtkRecentChooserClass.t
    where type 'a recent_manager_class_t = 'a GtkRecentManagerClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_action_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtk "gtk_recent_action_new")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INOPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val newForManager_ =
        call (load_sym libgtk "gtk_recent_action_new_for_manager")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val getShowNumbers_ = call (load_sym libgtk "gtk_recent_action_get_show_numbers") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setShowNumbers_ = call (load_sym libgtk "gtk_recent_action_set_show_numbers") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkRecentActionClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a recent_chooser_class_t = 'a GtkRecentChooserClass.t
    type 'a recent_manager_class_t = 'a GtkRecentManagerClass.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name label tooltip stockId =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> GtkRecentActionClass.C.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun newForManager name label tooltip stockId manager =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> GtkRecentActionClass.C.fromPtr true
      )
        newForManager_
        (
          name
           & label
           & tooltip
           & stockId
           & manager
        )
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
