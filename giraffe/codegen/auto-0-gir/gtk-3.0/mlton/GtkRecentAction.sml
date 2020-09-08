structure GtkRecentAction :>
  GTK_RECENT_ACTION
    where type 'a class = 'a GtkRecentActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    where type 'a recent_manager_class = 'a GtkRecentManagerClass.class =
  struct
    val getType_ = _import "gtk_recent_action_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_recent_action_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkActionClass.FFI.non_opt GtkActionClass.FFI.p;
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
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GtkRecentManagerClass.FFI.opt GtkRecentManagerClass.FFI.p
               -> GtkActionClass.FFI.non_opt GtkActionClass.FFI.p;
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
    val getShowNumbers_ = _import "gtk_recent_action_get_show_numbers" : GtkRecentActionClass.FFI.non_opt GtkRecentActionClass.FFI.p -> GBool.FFI.val_;
    val setShowNumbers_ = fn x1 & x2 => (_import "gtk_recent_action_set_show_numbers" : GtkRecentActionClass.FFI.non_opt GtkRecentActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkRecentActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    type 'a recent_manager_class = 'a GtkRecentManagerClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkRecentChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
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
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GtkRecentManagerClass.FFI.withOptPtr false
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
    fun getShowNumbers self = (GtkRecentActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowNumbers_ self
    fun setShowNumbers self showNumbers = (GtkRecentActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowNumbers_ (self & showNumbers)
    local
      open ValueAccessor
    in
      val showNumbersProp =
        {
          name = "show-numbers",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
