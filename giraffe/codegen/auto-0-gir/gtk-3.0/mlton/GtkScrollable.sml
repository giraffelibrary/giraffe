structure GtkScrollable :>
  GTK_SCROLLABLE
    where type 'a class_t = 'a GtkScrollableClass.t
    where type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    where type scrollable_policy_t = GtkScrollablePolicy.t =
  struct
    val getType_ = _import "gtk_scrollable_get_type" : unit -> GObjectType.C.val_;
    val getHadjustment_ = _import "gtk_scrollable_get_hadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getHscrollPolicy_ = _import "gtk_scrollable_get_hscroll_policy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkScrollablePolicy.C.val_;
    val getVadjustment_ = _import "gtk_scrollable_get_vadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getVscrollPolicy_ = _import "gtk_scrollable_get_vscroll_policy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkScrollablePolicy.C.val_;
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_scrollable_set_hadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setHscrollPolicy_ = fn x1 & x2 => (_import "gtk_scrollable_set_hscroll_policy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkScrollablePolicy.C.val_ -> unit;) (x1, x2)
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_scrollable_set_vadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setVscrollPolicy_ = fn x1 & x2 => (_import "gtk_scrollable_set_vscroll_policy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkScrollablePolicy.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkScrollableClass.t
    type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    type scrollable_policy_t = GtkScrollablePolicy.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getHadjustment_ self
    fun getHscrollPolicy self = (GObjectObjectClass.C.withPtr ---> GtkScrollablePolicy.C.fromVal) getHscrollPolicy_ self
    fun getVadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getVadjustment_ self
    fun getVscrollPolicy self = (GObjectObjectClass.C.withPtr ---> GtkScrollablePolicy.C.fromVal) getVscrollPolicy_ self
    fun setHadjustment self hadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setHadjustment_ (self & hadjustment)
    fun setHscrollPolicy self policy = (GObjectObjectClass.C.withPtr &&&> GtkScrollablePolicy.C.withVal ---> I) setHscrollPolicy_ (self & policy)
    fun setVadjustment self vadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setVadjustment_ (self & vadjustment)
    fun setVscrollPolicy self policy = (GObjectObjectClass.C.withPtr &&&> GtkScrollablePolicy.C.withVal ---> I) setVscrollPolicy_ (self & policy)
    local
      open Property
    in
      val hadjustmentProp =
        {
          get = fn x => get "hadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "hadjustment" GtkAdjustmentClass.tOpt x
        }
      val hscrollPolicyProp =
        {
          get = fn x => get "hscroll-policy" GtkScrollablePolicy.t x,
          set = fn x => set "hscroll-policy" GtkScrollablePolicy.t x
        }
      val vadjustmentProp =
        {
          get = fn x => get "vadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "vadjustment" GtkAdjustmentClass.tOpt x
        }
      val vscrollPolicyProp =
        {
          get = fn x => get "vscroll-policy" GtkScrollablePolicy.t x,
          set = fn x => set "vscroll-policy" GtkScrollablePolicy.t x
        }
    end
  end
