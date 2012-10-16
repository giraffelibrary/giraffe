structure GtkRecentAction :>
  GTK_RECENT_ACTION
    where type 'a class_t = 'a GtkRecentActionClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    where type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t =
  struct
    val getType_ = _import "gtk_recent_action_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_recent_action_new" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val newForManager_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8)
         & x9 =>
          (
            _import "mlton_gtk_recent_action_new_for_manager" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * unit GObjectObjectClass.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val getShowNumbers_ = _import "gtk_recent_action_get_show_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setShowNumbers_ = fn x1 & x2 => (_import "gtk_recent_action_set_show_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkRecentActionClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name label tooltip stockId =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
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
    fun getShowNumbers self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getShowNumbers_ self
    fun setShowNumbers self showNumbers = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setShowNumbers_ (self & showNumbers)
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
