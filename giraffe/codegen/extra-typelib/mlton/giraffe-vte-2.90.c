/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Vte C interface support for MLton
 */

#include <vte/vte.h>

#include "mlton/gcharptrffi.h"
#include "mlton/gcharptrptrffi.h"


/* VteTerminal */

void
giraffe_vte_terminal_set_colors (VteTerminal *terminal,
                                 const GdkColor *foreground,
                                 const GdkColor *background)
{
  vte_terminal_set_colors (terminal,
                           foreground,
                           background,
                           NULL,
                           0);
}

void
mlton_vte_terminal_set_font_from_string (VteTerminal *terminal,
                                         SML_GCHARPTR_VAL(name))
{
  vte_terminal_set_font_from_string (terminal,
                                     GET_SML_GCHARPTR_VAL(name));
}

gboolean
giraffe_vte_terminal_fork_command_full (VteTerminal *terminal,
                                        VtePtyFlags pty_flags,
                                        SML_GCHARPTR_VAL(working_directory),
                                        SML_GCHARPTRPTR_VAL(argv),
                                        SML_GCHARPTRPTR_VAL(envp),
                                        GSpawnFlags flags,
                                        GPid *child_pid,
                                        GError **error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         GET_SML_GCHARPTR_VAL(working_directory),
                                         GET_SML_GCHARPTRPTR_VAL(argv),
                                         GET_SML_GCHARPTRPTR_VAL(envp),
                                         flags,
                                         NULL,
                                         NULL,
                                         child_pid,
                                         error);
}


/*
 * This is commented out because child setup callbacks for VteTerminal
 * just don't work because the child setup callback _must_ call
 * vte_pty_child_setup (not documented in API) but vte_pty_child_setup
 * requires the terminal's VtePty object as its argument which is not
 * available to the callback.  vte_terminal_get_pty_object cannot be
 * used in the child setup callback because vte_terminal_set_pty_object
 * occurs after __vte_pty_spawn in vte_terminal_fork_command_full.
 *
 * So we always use NULL as the callback function which causes
 * vte_pty_child_setup to be called internally.

static void
giraffe_spawn_child_setup_dispatch (gpointer data)


gboolean
giraffe_vte_terminal_fork_command_full (VteTerminal *terminal,
                                        VtePtyFlags pty_flags,
                                        SML_GCHARPTR_VAL(working_directory),
                                        SML_GCHARPTRPTR_VAL(argv),
                                        SML_GCHARPTRPTR_VAL(envp),
                                        GSpawnFlags flags,
                                        guint callback_id,
                                        GPid *child_pid,
                                        GError **error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         GET_SML_GCHARPTR_VAL(working_directory),
                                         GET_SML_GCHARPTRPTR_VAL(argv),
                                         GET_SML_GCHARPTRPTR_VAL(envp),
                                         flags,
                                         giraffe_spawn_child_setup_dispatch,
                                         GUINT_TO_POINTER(callback_id),
                                         child_pid,
                                         error);
}

 *
 */
