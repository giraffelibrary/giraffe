(* Copyright (C) 2014, 2016-2017, 2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CairoContext :>
  CAIRO_CONTEXT
    where type t = CairoContextRecord.t
    where type antialias_t = CairoAntialias.t
    where type fillrule_t = CairoFillRule.t
    where type linecap_t = CairoLineCap.t
    where type linejoin_t = CairoLineJoin.t
    where type operator_t = CairoOperator.t
    where type status_t = CairoStatus.t
    where type content_t = CairoContent.t
    where type pattern_t = CairoPatternRecord.t
    where type surface_t = CairoSurfaceRecord.t =
  struct
    val getType_ = _import "cairo_gobject_context_get_type" : unit -> GObjectType.FFI.val_;
    val create_ = _import "cairo_create" : CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p -> CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p;
    val status_ = _import "cairo_status" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoStatus.FFI.val_;
    val save_ = _import "cairo_save" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val restore_ = _import "cairo_restore" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val getTarget_ = _import "cairo_get_target" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p;
    val pushGroup_ = _import "cairo_push_group" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val pushGroupWithContent_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_push_group_with_content" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoContent.FFI.val_
               -> unit;
          )
            (x1, x2)
    val popGroup_ = _import "cairo_pop_group" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoPatternRecord.FFI.non_opt CairoPatternRecord.FFI.p;
    val popGroupToSource_ = _import "cairo_pop_group_to_source" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val getGroupTarget_ = _import "cairo_get_group_target" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p;
    val setSourceRgb_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "cairo_set_source_rgb" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setSourceRgba_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "cairo_set_source_rgba" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setSource_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_source" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoPatternRecord.FFI.non_opt CairoPatternRecord.FFI.p
               -> unit;
          )
            (x1, x2)
    val setSourceSurface_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "cairo_set_source_surface" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getSource_ = _import "cairo_get_source" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoPatternRecord.FFI.non_opt CairoPatternRecord.FFI.p;
    val setAntialias_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_antialias" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoAntialias.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getAntialias_ = _import "cairo_get_antialias" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoAntialias.FFI.val_;
    val setDash_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_cairo_set_dash" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDoubleCArrayN.MLton.p1 * GDoubleCArrayN.FFI.non_opt GDoubleCArrayN.MLton.p2
               * GInt.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDashCount_ = _import "cairo_get_dash_count" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> GInt.FFI.val_;
    val getDash_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_cairo_get_dash" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDoubleCArrayN.MLton.p1 * GDoubleCArrayN.FFI.non_opt GDoubleCArrayN.MLton.p2
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFillRule_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_fill_rule" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoFillRule.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getFillRule_ = _import "cairo_get_fill_rule" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoFillRule.FFI.val_;
    val setLineCap_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_line_cap" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoLineCap.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getLineCap_ = _import "cairo_get_line_cap" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoLineCap.FFI.val_;
    val setLineJoin_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_line_join" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoLineJoin.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getLineJoin_ = _import "cairo_get_line_join" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoLineJoin.FFI.val_;
    val setLineWidth_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_line_width" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getLineWidth_ = _import "cairo_get_line_width" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> GDouble.FFI.val_;
    val setMiterLimit_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_miter_limit" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getMiterLimit_ = _import "cairo_get_miter_limit" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> GDouble.FFI.val_;
    val setOperator_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_operator" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoOperator.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getOperator_ = _import "cairo_get_operator" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> CairoOperator.FFI.val_;
    val setTolerance_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_set_tolerance" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               -> unit;
          )
            (x1, x2)
    val getTolerance_ = _import "cairo_get_tolerance" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> GDouble.FFI.val_;
    val clip_ = _import "cairo_clip" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val clipPreserve_ = _import "cairo_clip_preserve" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val clipExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "cairo_clip_extents" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val inClip_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_in_clip" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val resetClip_ = _import "cairo_reset_clip" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val fill_ = _import "cairo_fill" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val fillPreserve_ = _import "cairo_fill_preserve" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val fillExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "cairo_fill_extents" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val inFill_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_in_fill" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mask_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_mask" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoPatternRecord.FFI.non_opt CairoPatternRecord.FFI.p
               -> unit;
          )
            (x1, x2)
    val maskSurface_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "cairo_mask_surface" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val paint_ = _import "cairo_paint" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val paintWithAlpha_ =
      fn
        x1 & x2 =>
          (
            _import "cairo_paint_with_alpha" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               -> unit;
          )
            (x1, x2)
    val stroke_ = _import "cairo_stroke" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val strokePreserve_ = _import "cairo_stroke_preserve" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val strokeExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "cairo_stroke_extents" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val inStroke_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_in_stroke" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val copyPage_ = _import "cairo_copy_page" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val showPage_ = _import "cairo_show_page" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val hasCurrentPoint_ = _import "cairo_has_current_point" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> GBool.FFI.val_;
    val getCurrentPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_get_current_point" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val newPath_ = _import "cairo_new_path" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val newSubPath_ = _import "cairo_new_sub_path" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val closePath_ = _import "cairo_close_path" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;
    val arc_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "cairo_arc" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val arcNegative_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "cairo_arc_negative" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val curveTo_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "cairo_curve_to" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val lineTo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_line_to" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val moveTo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_move_to" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rectangle_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "cairo_rectangle" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val relCurveTo_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "cairo_rel_curve_to" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val relLineTo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_rel_line_to" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val relMoveTo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "cairo_rel_move_to" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pathExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "cairo_path_extents" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type t = CairoContextRecord.t
    type antialias_t = CairoAntialias.t
    type fillrule_t = CairoFillRule.t
    type linecap_t = CairoLineCap.t
    type linejoin_t = CairoLineJoin.t
    type operator_t = CairoOperator.t
    type status_t = CairoStatus.t
    type content_t = CairoContent.t
    type pattern_t = CairoPatternRecord.t
    type surface_t = CairoSurfaceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun create target = (CairoSurfaceRecord.FFI.withPtr false ---> CairoContextRecord.FFI.fromPtr true) create_ target
    fun status cr = (CairoContextRecord.FFI.withPtr false ---> CairoStatus.FFI.fromVal) status_ cr
    fun save cr = (CairoContextRecord.FFI.withPtr false ---> I) save_ cr
    fun restore cr = (CairoContextRecord.FFI.withPtr false ---> I) restore_ cr
    fun getTarget cr = (CairoContextRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr false) getTarget_ cr
    fun pushGroup cr = (CairoContextRecord.FFI.withPtr false ---> I) pushGroup_ cr
    fun pushGroupWithContent cr content =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> CairoContent.FFI.withVal
         ---> I
      )
        pushGroupWithContent_
        (cr & content)
    fun popGroup cr = (CairoContextRecord.FFI.withPtr false ---> CairoPatternRecord.FFI.fromPtr true) popGroup_ cr
    fun popGroupToSource cr = (CairoContextRecord.FFI.withPtr false ---> I) popGroupToSource_ cr
    fun getGroupTarget cr = (CairoContextRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr false) getGroupTarget_ cr
    fun setSourceRgb cr (red, green, blue) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setSourceRgb_
        (
          cr
           & red
           & green
           & blue
        )
    fun setSourceRgba cr (red, green, blue, alpha) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setSourceRgba_
        (
          cr
           & red
           & green
           & blue
           & alpha
        )
    fun setSource cr source = (CairoContextRecord.FFI.withPtr false &&&> CairoPatternRecord.FFI.withPtr false ---> I) setSource_ (cr & source)
    fun setSourceSurface cr (surface, x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> CairoSurfaceRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setSourceSurface_
        (
          cr
           & surface
           & x
           & y
        )
    fun getSource cr = (CairoContextRecord.FFI.withPtr false ---> CairoPatternRecord.FFI.fromPtr false) getSource_ cr
    fun setAntialias cr antialias = (CairoContextRecord.FFI.withPtr false &&&> CairoAntialias.FFI.withVal ---> I) setAntialias_ (cr & antialias)
    fun getAntialias cr = (CairoContextRecord.FFI.withPtr false ---> CairoAntialias.FFI.fromVal) getAntialias_ cr
    fun setDash cr (dashes, offset) =
      let
        val numDashes = LargeInt.fromInt (GDoubleCArrayN.length dashes)
      in
        (
          CairoContextRecord.FFI.withPtr false
           &&&> GDoubleCArrayN.FFI.withPtr 0
           &&&> GInt.FFI.withVal
           &&&> GDouble.FFI.withVal
           ---> I
        )
          setDash_
          (
            cr
             & dashes
             & numDashes
             & offset
          )
      end
    fun getDashCount cr = (CairoContextRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getDashCount_ cr
    fun getDash cr =
      let
        val count = LargeInt.toInt (getDashCount cr)
        val dashes
         & offset
         & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDoubleCArrayN.FFI.withNewPtr
             &&&> GDouble.FFI.withRefVal
             ---> GDoubleCArrayN.FFI.fromPtr ~1 && GDouble.FFI.fromVal && I
          )
            getDash_
            (
              cr
               & count
               & GDouble.null
            )
      in
        (dashes count, offset)
      end
    fun setFillRule cr fillRule = (CairoContextRecord.FFI.withPtr false &&&> CairoFillRule.FFI.withVal ---> I) setFillRule_ (cr & fillRule)
    fun getFillRule cr = (CairoContextRecord.FFI.withPtr false ---> CairoFillRule.FFI.fromVal) getFillRule_ cr
    fun setLineCap cr lineCap = (CairoContextRecord.FFI.withPtr false &&&> CairoLineCap.FFI.withVal ---> I) setLineCap_ (cr & lineCap)
    fun getLineCap cr = (CairoContextRecord.FFI.withPtr false ---> CairoLineCap.FFI.fromVal) getLineCap_ cr
    fun setLineJoin cr lineJoin = (CairoContextRecord.FFI.withPtr false &&&> CairoLineJoin.FFI.withVal ---> I) setLineJoin_ (cr & lineJoin)
    fun getLineJoin cr = (CairoContextRecord.FFI.withPtr false ---> CairoLineJoin.FFI.fromVal) getLineJoin_ cr
    fun setLineWidth cr width = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setLineWidth_ (cr & width)
    fun getLineWidth cr = (CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getLineWidth_ cr
    fun setMiterLimit cr limit = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setMiterLimit_ (cr & limit)
    fun getMiterLimit cr = (CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getMiterLimit_ cr
    fun setOperator cr op' = (CairoContextRecord.FFI.withPtr false &&&> CairoOperator.FFI.withVal ---> I) setOperator_ (cr & op')
    fun getOperator cr = (CairoContextRecord.FFI.withPtr false ---> CairoOperator.FFI.fromVal) getOperator_ cr
    fun setTolerance cr tolerance = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setTolerance_ (cr & tolerance)
    fun getTolerance cr = (CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getTolerance_ cr
    fun clip cr = (CairoContextRecord.FFI.withPtr false ---> I) clip_ cr
    fun clipPreserve cr = (CairoContextRecord.FFI.withPtr false ---> I) clipPreserve_ cr
    fun clipExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            clipExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
    fun inClip cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        inClip_
        (
          cr
           & x
           & y
        )
    fun resetClip cr = (CairoContextRecord.FFI.withPtr false ---> I) resetClip_ cr
    fun fill cr = (CairoContextRecord.FFI.withPtr false ---> I) fill_ cr
    fun fillPreserve cr = (CairoContextRecord.FFI.withPtr false ---> I) fillPreserve_ cr
    fun fillExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            fillExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
    fun inFill cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        inFill_
        (
          cr
           & x
           & y
        )
    fun mask cr pattern = (CairoContextRecord.FFI.withPtr false &&&> CairoPatternRecord.FFI.withPtr false ---> I) mask_ (cr & pattern)
    fun maskSurface cr (surface, surface_x, surface_y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> CairoSurfaceRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        maskSurface_
        (
          cr
           & surface
           & surface_x
           & surface_y
        )
    fun paint cr = (CairoContextRecord.FFI.withPtr false ---> I) paint_ cr
    fun paintWithAlpha cr alpha = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) paintWithAlpha_ (cr & alpha)
    fun stroke cr = (CairoContextRecord.FFI.withPtr false ---> I) stroke_ cr
    fun strokePreserve cr = (CairoContextRecord.FFI.withPtr false ---> I) strokePreserve_ cr
    fun strokeExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            strokeExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
    fun inStroke cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        inStroke_
        (
          cr
           & x
           & y
        )
    fun copyPage cr = (CairoContextRecord.FFI.withPtr false ---> I) copyPage_ cr
    fun showPage cr = (CairoContextRecord.FFI.withPtr false ---> I) showPage_ cr
    fun hasCurrentPoint cr = (CairoContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal) hasCurrentPoint_ cr
    fun getCurrentPoint cr =
      let
        val x & y & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getCurrentPoint_
            (
              cr
               & GDouble.null
               & GDouble.null
            )
      in
        (x, y)
      end
    fun newPath cr = (CairoContextRecord.FFI.withPtr false ---> I) newPath_ cr
    fun newSubPath cr = (CairoContextRecord.FFI.withPtr false ---> I) newSubPath_ cr
    fun closePath cr = (CairoContextRecord.FFI.withPtr false ---> I) closePath_ cr
    fun arc cr (xc, yc, radius, angle1, angle2) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        arc_
        (
          cr
           & xc
           & yc
           & radius
           & angle1
           & angle2
        )
    fun arcNegative cr (xc, yc, radius, angle1, angle2) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        arcNegative_
        (
          cr
           & xc
           & yc
           & radius
           & angle1
           & angle2
        )
    fun curveTo cr (x1, y1, x2, y2, x3, y3) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        curveTo_
        (
          cr
           & x1
           & y1
           & x2
           & y2
           & x3
           & y3
        )
    fun lineTo cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        lineTo_
        (
          cr
           & x
           & y
        )
    fun moveTo cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        moveTo_
        (
          cr
           & x
           & y
        )
    fun rectangle cr (x, y, width, height) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        rectangle_
        (
          cr
           & x
           & y
           & width
           & height
        )
    fun relCurveTo cr (dx1, dy1, dx2, dy2, dx3, dy3) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        relCurveTo_
        (
          cr
           & dx1
           & dy1
           & dx2
           & dy2
           & dx3
           & dy3
        )
    fun relLineTo cr (dx, dy) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        relLineTo_
        (
          cr
           & dx
           & dy
        )
    fun relMoveTo cr (dx, dy) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        relMoveTo_
        (
          cr
           & dx
           & dy
        )
    fun pathExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            pathExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
  end
