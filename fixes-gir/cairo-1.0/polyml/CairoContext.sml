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
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "cairo_gobject_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val create_ = call (externalFunctionSymbol "cairo_create") (CairoSurfaceRecord.PolyML.cPtr --> CairoContextRecord.PolyML.cPtr)
      val status_ = call (externalFunctionSymbol "cairo_status") (CairoContextRecord.PolyML.cPtr --> CairoStatus.PolyML.cVal)
      val save_ = call (externalFunctionSymbol "cairo_save") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val restore_ = call (externalFunctionSymbol "cairo_restore") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val getTarget_ = call (externalFunctionSymbol "cairo_get_target") (CairoContextRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val pushGroup_ = call (externalFunctionSymbol "cairo_push_group") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val pushGroupWithContent_ =
        call
          (externalFunctionSymbol "cairo_push_group_with_content")
          (
            CairoContextRecord.PolyML.cPtr
             &&> CairoContent.PolyML.cVal
             --> cVoid
          )
      val popGroup_ = call (externalFunctionSymbol "cairo_pop_group") (CairoContextRecord.PolyML.cPtr --> CairoPatternRecord.PolyML.cPtr)
      val popGroupToSource_ = call (externalFunctionSymbol "cairo_pop_group_to_source") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val getGroupTarget_ = call (externalFunctionSymbol "cairo_get_group_target") (CairoContextRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val setSourceRgb_ =
        call
          (externalFunctionSymbol "cairo_set_source_rgb")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setSourceRgba_ =
        call
          (externalFunctionSymbol "cairo_set_source_rgba")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setSource_ = call (externalFunctionSymbol "cairo_set_source") (CairoContextRecord.PolyML.cPtr &&> CairoPatternRecord.PolyML.cPtr --> cVoid)
      val setSourceSurface_ =
        call
          (externalFunctionSymbol "cairo_set_source_surface")
          (
            CairoContextRecord.PolyML.cPtr
             &&> CairoSurfaceRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val getSource_ = call (externalFunctionSymbol "cairo_get_source") (CairoContextRecord.PolyML.cPtr --> CairoPatternRecord.PolyML.cPtr)
      val setAntialias_ = call (externalFunctionSymbol "cairo_set_antialias") (CairoContextRecord.PolyML.cPtr &&> CairoAntialias.PolyML.cVal --> cVoid)
      val getAntialias_ = call (externalFunctionSymbol "cairo_get_antialias") (CairoContextRecord.PolyML.cPtr --> CairoAntialias.PolyML.cVal)
      val setDash_ =
        call
          (externalFunctionSymbol "cairo_set_dash")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDoubleCArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val getDashCount_ = call (externalFunctionSymbol "cairo_get_dash_count") (CairoContextRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getDash_ =
        call
          (externalFunctionSymbol "cairo_get_dash")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDoubleCArrayN.PolyML.cInPtr
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val setFillRule_ = call (externalFunctionSymbol "cairo_set_fill_rule") (CairoContextRecord.PolyML.cPtr &&> CairoFillRule.PolyML.cVal --> cVoid)
      val getFillRule_ = call (externalFunctionSymbol "cairo_get_fill_rule") (CairoContextRecord.PolyML.cPtr --> CairoFillRule.PolyML.cVal)
      val setLineCap_ = call (externalFunctionSymbol "cairo_set_line_cap") (CairoContextRecord.PolyML.cPtr &&> CairoLineCap.PolyML.cVal --> cVoid)
      val getLineCap_ = call (externalFunctionSymbol "cairo_get_line_cap") (CairoContextRecord.PolyML.cPtr --> CairoLineCap.PolyML.cVal)
      val setLineJoin_ = call (externalFunctionSymbol "cairo_set_line_join") (CairoContextRecord.PolyML.cPtr &&> CairoLineJoin.PolyML.cVal --> cVoid)
      val getLineJoin_ = call (externalFunctionSymbol "cairo_get_line_join") (CairoContextRecord.PolyML.cPtr --> CairoLineJoin.PolyML.cVal)
      val setLineWidth_ = call (externalFunctionSymbol "cairo_set_line_width") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val getLineWidth_ = call (externalFunctionSymbol "cairo_get_line_width") (CairoContextRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setMiterLimit_ = call (externalFunctionSymbol "cairo_set_miter_limit") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val getMiterLimit_ = call (externalFunctionSymbol "cairo_get_miter_limit") (CairoContextRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setOperator_ = call (externalFunctionSymbol "cairo_set_operator") (CairoContextRecord.PolyML.cPtr &&> CairoOperator.PolyML.cVal --> cVoid)
      val getOperator_ = call (externalFunctionSymbol "cairo_get_operator") (CairoContextRecord.PolyML.cPtr --> CairoOperator.PolyML.cVal)
      val setTolerance_ = call (externalFunctionSymbol "cairo_set_tolerance") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val getTolerance_ = call (externalFunctionSymbol "cairo_get_tolerance") (CairoContextRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val clip_ = call (externalFunctionSymbol "cairo_clip") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val clipPreserve_ = call (externalFunctionSymbol "cairo_clip_preserve") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val clipExtents_ =
        call
          (externalFunctionSymbol "cairo_clip_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val inClip_ =
        call
          (externalFunctionSymbol "cairo_in_clip")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val resetClip_ = call (externalFunctionSymbol "cairo_reset_clip") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val fill_ = call (externalFunctionSymbol "cairo_fill") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val fillPreserve_ = call (externalFunctionSymbol "cairo_fill_preserve") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val fillExtents_ =
        call
          (externalFunctionSymbol "cairo_fill_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val inFill_ =
        call
          (externalFunctionSymbol "cairo_in_fill")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val mask_ = call (externalFunctionSymbol "cairo_mask") (CairoContextRecord.PolyML.cPtr &&> CairoPatternRecord.PolyML.cPtr --> cVoid)
      val maskSurface_ =
        call
          (externalFunctionSymbol "cairo_mask_surface")
          (
            CairoContextRecord.PolyML.cPtr
             &&> CairoSurfaceRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val paint_ = call (externalFunctionSymbol "cairo_paint") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val paintWithAlpha_ = call (externalFunctionSymbol "cairo_paint_with_alpha") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val stroke_ = call (externalFunctionSymbol "cairo_stroke") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val strokePreserve_ = call (externalFunctionSymbol "cairo_stroke_preserve") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val strokeExtents_ =
        call
          (externalFunctionSymbol "cairo_stroke_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val inStroke_ =
        call
          (externalFunctionSymbol "cairo_in_stroke")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val copyPage_ = call (externalFunctionSymbol "cairo_copy_page") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val showPage_ = call (externalFunctionSymbol "cairo_show_page") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val hasCurrentPoint_ = call (externalFunctionSymbol "cairo_has_current_point") (CairoContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCurrentPoint_ =
        call
          (externalFunctionSymbol "cairo_get_current_point")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val newPath_ = call (externalFunctionSymbol "cairo_new_path") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val newSubPath_ = call (externalFunctionSymbol "cairo_new_sub_path") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val closePath_ = call (externalFunctionSymbol "cairo_close_path") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val arc_ =
        call
          (externalFunctionSymbol "cairo_arc")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val arcNegative_ =
        call
          (externalFunctionSymbol "cairo_arc_negative")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val curveTo_ =
        call
          (externalFunctionSymbol "cairo_curve_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val lineTo_ =
        call
          (externalFunctionSymbol "cairo_line_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val moveTo_ =
        call
          (externalFunctionSymbol "cairo_move_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val rectangle_ =
        call
          (externalFunctionSymbol "cairo_rectangle")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val relCurveTo_ =
        call
          (externalFunctionSymbol "cairo_rel_curve_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val relLineTo_ =
        call
          (externalFunctionSymbol "cairo_rel_line_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val relMoveTo_ =
        call
          (externalFunctionSymbol "cairo_rel_move_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val pathExtents_ =
        call
          (externalFunctionSymbol "cairo_path_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
    end
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
