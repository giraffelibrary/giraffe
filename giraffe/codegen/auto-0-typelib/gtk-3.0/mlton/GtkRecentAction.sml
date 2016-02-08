structure GtkRecentAction :>
  GTK_RECENT_ACTION
    where type 'a class_t = 'a GtkRecentActionClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a recent_chooser_class_t = 'a GtkRecentChooserClass.t
    where type 'a recent_manager_class_t = 'a GtkRecentManagerClass.t =
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
    val getShowNumbers_ = _import "gtk_recent_action_get_show_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setShowNumbers_ = fn x1 & x2 => (_import "gtk_recent_action_set_show_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
        Utf8.C.withConstPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> Utf8.C.withConstOptPtr
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
        Utf8.C.withConstPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> Utf8.C.withConstOptPtr
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
