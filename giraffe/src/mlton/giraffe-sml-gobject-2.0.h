/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GObject SML interface exported by MLton
 */

/* ClosureMarshal */

extern
gint32 giraffe_closure_dispatch_smlside (guint id,
                                         GValue *return_value,
                                         const GValue *param_values,
                                         guint n_param_values);

extern
void giraffe_closure_destroy_smlside (guint id);
