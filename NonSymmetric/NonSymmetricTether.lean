/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Analysis.InnerProductSpace.Basic

open InnerProductSpace

namespace NonSymmetricTether

/-- Experimental non-symmetric bilinear form.
The cross product against a local unit vector e makes it non-symmetric
while remaining built from the projected functional derivatives. -/
def NonSymmetricTetherKernel
    (κ : ℝ)
    (ω_norm_sq : ℝ)
    (e : ℝ × ℝ × ℝ)
    (proj_F proj_G : ℝ × ℝ × ℝ) : ℝ :=
  -κ * ω_norm_sq * (inner (proj_F × e) proj_G)

end NonSymmetricTether
