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
    local
      val call = CairoSurfaceRecord.FFI.withPtr false ---> CairoContextRecord.FFI.fromPtr true
    in
      fun create target = call create_ target
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoStatus.FFI.fromVal
    in
      fun status cr = call status_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun save cr = call save_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun restore cr = call restore_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr false
    in
      fun getTarget cr = call getTarget_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun pushGroup cr = call pushGroup_ cr
    end
    fun pushGroupWithContent cr content =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> CairoContent.FFI.withVal
         ---> I
      )
        pushGroupWithContent_
        (cr & content)
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoPatternRecord.FFI.fromPtr true
    in
      fun popGroup cr = call popGroup_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun popGroupToSource cr = call popGroupToSource_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr false
    in
      fun getGroupTarget cr = call getGroupTarget_ cr
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun setSourceRgb cr (red, green, blue) =
        call setSourceRgb_
          (
            cr
             & red
             & green
             & blue
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun setSourceRgba cr (red, green, blue, alpha) =
        call setSourceRgba_
          (
            cr
             & red
             & green
             & blue
             & alpha
          )
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> CairoPatternRecord.FFI.withPtr false ---> I
    in
      fun setSource cr source = call setSource_ (cr & source)
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> CairoSurfaceRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun setSourceSurface cr (surface, x, y) =
        call setSourceSurface_
          (
            cr
             & surface
             & x
             & y
          )
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoPatternRecord.FFI.fromPtr false
    in
      fun getSource cr = call getSource_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> CairoAntialias.FFI.withVal ---> I
    in
      fun setAntialias cr antialias = call setAntialias_ (cr & antialias)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoAntialias.FFI.fromVal
    in
      fun getAntialias cr = call getAntialias_ cr
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDoubleCArrayN.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun setDash cr (dashes, offset) =
        let
          val numDashes = LargeInt.fromInt (GDoubleCArrayN.length dashes)
        in
          call setDash_
            (
              cr
               & dashes
               & numDashes
               & offset
            )
        end
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getDashCount cr = call getDashCount_ cr
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDoubleCArrayN.FFI.withNewPtr
         &&&> GDouble.FFI.withRefVal
         ---> GDoubleCArrayN.FFI.fromPtr ~1 && GDouble.FFI.fromVal && I
    in
      fun getDash cr =
        let
          val count = LargeInt.toInt (getDashCount cr)
          val dashes
           & offset
           & () =
            call getDash_
              (
                cr
                 & count
                 & GDouble.null
              )
        in
          (dashes count, offset)
        end
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> CairoFillRule.FFI.withVal ---> I
    in
      fun setFillRule cr fillRule = call setFillRule_ (cr & fillRule)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoFillRule.FFI.fromVal
    in
      fun getFillRule cr = call getFillRule_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> CairoLineCap.FFI.withVal ---> I
    in
      fun setLineCap cr lineCap = call setLineCap_ (cr & lineCap)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoLineCap.FFI.fromVal
    in
      fun getLineCap cr = call getLineCap_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> CairoLineJoin.FFI.withVal ---> I
    in
      fun setLineJoin cr lineJoin = call setLineJoin_ (cr & lineJoin)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoLineJoin.FFI.fromVal
    in
      fun getLineJoin cr = call getLineJoin_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun setLineWidth cr width = call setLineWidth_ (cr & width)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal
    in
      fun getLineWidth cr = call getLineWidth_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun setMiterLimit cr limit = call setMiterLimit_ (cr & limit)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal
    in
      fun getMiterLimit cr = call getMiterLimit_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> CairoOperator.FFI.withVal ---> I
    in
      fun setOperator cr op' = call setOperator_ (cr & op')
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> CairoOperator.FFI.fromVal
    in
      fun getOperator cr = call getOperator_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun setTolerance cr tolerance = call setTolerance_ (cr & tolerance)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal
    in
      fun getTolerance cr = call getTolerance_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun clip cr = call clip_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun clipPreserve cr = call clipPreserve_ cr
    end
    local
      val call =
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
    in
      fun clipExtents cr =
        let
          val x1 & y1 & x2 & y2 & () =
            call clipExtents_
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
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
    in
      fun inClip cr (x, y) =
        call inClip_
          (
            cr
             & x
             & y
          )
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun resetClip cr = call resetClip_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun fill cr = call fill_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun fillPreserve cr = call fillPreserve_ cr
    end
    local
      val call =
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
    in
      fun fillExtents cr =
        let
          val x1 & y1 & x2 & y2 & () =
            call fillExtents_
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
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
    in
      fun inFill cr (x, y) =
        call inFill_
          (
            cr
             & x
             & y
          )
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> CairoPatternRecord.FFI.withPtr false ---> I
    in
      fun mask cr pattern = call mask_ (cr & pattern)
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> CairoSurfaceRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun maskSurface cr (surface, surface_x, surface_y) =
        call maskSurface_
          (
            cr
             & surface
             & surface_x
             & surface_y
          )
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun paint cr = call paint_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun paintWithAlpha cr alpha = call paintWithAlpha_ (cr & alpha)
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun stroke cr = call stroke_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun strokePreserve cr = call strokePreserve_ cr
    end
    local
      val call =
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
    in
      fun strokeExtents cr =
        let
          val x1 & y1 & x2 & y2 & () =
            call strokeExtents_
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
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
    in
      fun inStroke cr (x, y) =
        call inStroke_
          (
            cr
             & x
             & y
          )
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun copyPage cr = call copyPage_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun showPage cr = call showPage_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hasCurrentPoint cr = call hasCurrentPoint_ cr
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withRefVal
         &&&> GDouble.FFI.withRefVal
         ---> GDouble.FFI.fromVal
               && GDouble.FFI.fromVal
               && I
    in
      fun getCurrentPoint cr =
        let
          val x & y & () =
            call getCurrentPoint_
              (
                cr
                 & GDouble.null
                 & GDouble.null
              )
        in
          (x, y)
        end
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun newPath cr = call newPath_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun newSubPath cr = call newSubPath_ cr
    end
    local
      val call = CairoContextRecord.FFI.withPtr false ---> I
    in
      fun closePath cr = call closePath_ cr
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun arc cr (xc, yc, radius, angle1, angle2) =
        call arc_
          (
            cr
             & xc
             & yc
             & radius
             & angle1
             & angle2
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun arcNegative cr (xc, yc, radius, angle1, angle2) =
        call arcNegative_
          (
            cr
             & xc
             & yc
             & radius
             & angle1
             & angle2
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun curveTo cr (x1, y1, x2, y2, x3, y3) =
        call curveTo_
          (
            cr
             & x1
             & y1
             & x2
             & y2
             & x3
             & y3
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun lineTo cr (x, y) =
        call lineTo_
          (
            cr
             & x
             & y
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun moveTo cr (x, y) =
        call moveTo_
          (
            cr
             & x
             & y
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun rectangle cr (x, y, width, height) =
        call rectangle_
          (
            cr
             & x
             & y
             & width
             & height
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun relCurveTo cr (dx1, dy1, dx2, dy2, dx3, dy3) =
        call relCurveTo_
          (
            cr
             & dx1
             & dy1
             & dx2
             & dy2
             & dx3
             & dy3
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun relLineTo cr (dx, dy) =
        call relLineTo_
          (
            cr
             & dx
             & dy
          )
    end
    local
      val call =
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
    in
      fun relMoveTo cr (dx, dy) =
        call relMoveTo_
          (
            cr
             & dx
             & dy
          )
    end
    local
      val call =
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
    in
      fun pathExtents cr =
        let
          val x1 & y1 & x2 & y2 & () =
            call pathExtents_
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
  end
