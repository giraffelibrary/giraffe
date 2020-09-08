structure GtkScrollable :>
  GTK_SCROLLABLE
    where type 'a class = 'a GtkScrollableClass.class
    where type border_t = GtkBorderRecord.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type scrollable_policy_t = GtkScrollablePolicy.t =
  struct
    val getType_ = _import "gtk_scrollable_get_type" : unit -> GObjectType.FFI.val_;
    val getBorder_ = fn x1 & x2 => (_import "gtk_scrollable_get_border" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p * GtkBorderRecord.FFI.non_opt GtkBorderRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getHadjustment_ = _import "gtk_scrollable_get_hadjustment" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getHscrollPolicy_ = _import "gtk_scrollable_get_hscroll_policy" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p -> GtkScrollablePolicy.FFI.val_;
    val getVadjustment_ = _import "gtk_scrollable_get_vadjustment" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getVscrollPolicy_ = _import "gtk_scrollable_get_vscroll_policy" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p -> GtkScrollablePolicy.FFI.val_;
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_scrollable_set_hadjustment" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setHscrollPolicy_ = fn x1 & x2 => (_import "gtk_scrollable_set_hscroll_policy" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p * GtkScrollablePolicy.FFI.val_ -> unit;) (x1, x2)
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_scrollable_set_vadjustment" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setVscrollPolicy_ = fn x1 & x2 => (_import "gtk_scrollable_set_vscroll_policy" : GtkScrollableClass.FFI.non_opt GtkScrollableClass.FFI.p * GtkScrollablePolicy.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkScrollableClass.class
    type border_t = GtkBorderRecord.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type scrollable_policy_t = GtkScrollablePolicy.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBorder self =
      let
        val border & retVal = (GtkScrollableClass.FFI.withPtr false &&&> GtkBorderRecord.FFI.withNewPtr ---> GtkBorderRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBorder_ (self & ())
      in
        if retVal then SOME border else NONE
      end
    fun getHadjustment self = (GtkScrollableClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getHscrollPolicy self = (GtkScrollableClass.FFI.withPtr false ---> GtkScrollablePolicy.FFI.fromVal) getHscrollPolicy_ self
    fun getVadjustment self = (GtkScrollableClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun getVscrollPolicy self = (GtkScrollableClass.FFI.withPtr false ---> GtkScrollablePolicy.FFI.fromVal) getVscrollPolicy_ self
    fun setHadjustment self hadjustment = (GtkScrollableClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setHadjustment_ (self & hadjustment)
    fun setHscrollPolicy self policy = (GtkScrollableClass.FFI.withPtr false &&&> GtkScrollablePolicy.FFI.withVal ---> I) setHscrollPolicy_ (self & policy)
    fun setVadjustment self vadjustment = (GtkScrollableClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setVadjustment_ (self & vadjustment)
    fun setVscrollPolicy self policy = (GtkScrollableClass.FFI.withPtr false &&&> GtkScrollablePolicy.FFI.withVal ---> I) setVscrollPolicy_ (self & policy)
    local
      open ValueAccessor
    in
      val hadjustmentProp =
        {
          name = "hadjustment",
          gtype = fn () => C.gtype GtkAdjustmentClass.tOpt (),
          get = fn x => fn () => C.get GtkAdjustmentClass.tOpt x,
          set = fn x => C.set GtkAdjustmentClass.tOpt x,
          init = fn x => C.set GtkAdjustmentClass.tOpt x
        }
      val hscrollPolicyProp =
        {
          name = "hscroll-policy",
          gtype = fn () => C.gtype GtkScrollablePolicy.t (),
          get = fn x => fn () => C.get GtkScrollablePolicy.t x,
          set = fn x => C.set GtkScrollablePolicy.t x,
          init = fn x => C.set GtkScrollablePolicy.t x
        }
      val vadjustmentProp =
        {
          name = "vadjustment",
          gtype = fn () => C.gtype GtkAdjustmentClass.tOpt (),
          get = fn x => fn () => C.get GtkAdjustmentClass.tOpt x,
          set = fn x => C.set GtkAdjustmentClass.tOpt x,
          init = fn x => C.set GtkAdjustmentClass.tOpt x
        }
      val vscrollPolicyProp =
        {
          name = "vscroll-policy",
          gtype = fn () => C.gtype GtkScrollablePolicy.t (),
          get = fn x => fn () => C.get GtkScrollablePolicy.t x,
          set = fn x => C.set GtkScrollablePolicy.t x,
          init = fn x => C.set GtkScrollablePolicy.t x
        }
    end
  end
