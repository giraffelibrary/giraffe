(* Copyright (C) 2015, 2016-2017, 2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CAIRO_CONTEXT =
  sig
    type t
    type antialias_t
    type fillrule_t
    type linecap_t
    type linejoin_t
    type operator_t
    type status_t
    type content_t
    type pattern_t
    type surface_t
    val getType : unit -> GObject.Type.t
    val create : surface_t -> t
    val status : t -> status_t
    val save : t -> unit
    val restore : t -> unit
    val getTarget : t -> surface_t
    val pushGroup : t -> unit
    val pushGroupWithContent : t -> content_t -> unit
    val popGroup : t -> pattern_t
    val popGroupToSource : t -> unit
    val getGroupTarget : t -> surface_t
    val setSourceRgb : t -> real * real * real -> unit
    val setSourceRgba : t -> real * real * real * real -> unit
    val setSource : t -> pattern_t -> unit
    val setSourceSurface : t -> surface_t * real * real -> unit
    val getSource : t -> pattern_t
    val setAntialias : t -> antialias_t -> unit
    val getAntialias : t -> antialias_t
    val setDash : t -> GDoubleCArrayN.t * real -> unit
    val getDashCount : t -> LargeInt.int
    val getDash : t -> GDoubleCArrayN.t * real
    val setFillRule : t -> fillrule_t -> unit
    val getFillRule : t -> fillrule_t
    val setLineCap : t -> linecap_t -> unit
    val getLineCap : t -> linecap_t
    val setLineJoin : t -> linejoin_t -> unit
    val getLineJoin : t -> linejoin_t
    val setLineWidth : t -> real -> unit
    val getLineWidth : t -> real
    val setMiterLimit : t -> real -> unit
    val getMiterLimit : t -> real
    val setOperator : t -> operator_t -> unit
    val getOperator : t -> operator_t
    val setTolerance : t -> real -> unit
    val getTolerance : t -> real
    val clip : t -> unit
    val clipPreserve : t -> unit
    val clipExtents : t -> real * real * real * real
    val inClip : t -> real * real -> bool
    val resetClip : t -> unit
(*
cairo_rectangle_list_t;

cairo_rectangle_list_t * cairo_copy_clip_rectangle_list (cairo_t *cr);
*)
    val fill : t -> unit
    val fillPreserve : t -> unit
    val fillExtents : t -> real * real * real * real
    val inFill : t -> real * real -> bool
    val mask : t -> pattern_t -> unit
    val maskSurface : t -> surface_t * real * real -> unit
    val paint : t -> unit
    val paintWithAlpha : t -> real -> unit
    val stroke : t -> unit
    val strokePreserve : t -> unit
    val strokeExtents : t -> real * real * real * real
    val inStroke : t -> real * real -> bool
    val copyPage : t -> unit
    val showPage : t -> unit
(*
cairo_path_t *      cairo_copy_path                     (cairo_t *cr);

cairo_path_t *      cairo_copy_path_flat                (cairo_t *cr);

void                cairo_append_path                   (cairo_t *cr,
                                                         const cairo_path_t *path);
*)
    val hasCurrentPoint : t -> bool
    val getCurrentPoint : t -> real * real
    val newPath : t -> unit
    val newSubPath : t -> unit
    val closePath : t -> unit
    val arc :
      t
       -> real
           * real
           * real
           * real
           * real
       -> unit
    val arcNegative :
      t
       -> real
           * real
           * real
           * real
           * real
       -> unit
    val curveTo :
      t
       -> real
           * real
           * real
           * real
           * real
           * real
       -> unit
    val lineTo : t -> real * real -> unit
    val moveTo : t -> real * real -> unit
    val rectangle :
      t
       -> real
           * real
           * real
           * real
       -> unit
    val relCurveTo :
      t
       -> real
           * real
           * real
           * real
           * real
           * real
       -> unit
    val relLineTo :
      t
       -> real * real
       -> unit
    val relMoveTo :
      t
       -> real * real
       -> unit
    val pathExtents : t -> real * real * real * real
  end
