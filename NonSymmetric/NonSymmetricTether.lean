/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.LinearAlgebra.CrossProduct
import Mathlib.Data.Real.Basic

open Matrix
open scoped Matrix

namespace NonSymmetricTether

/-- Experimental non-symmetric bilinear form.
The cross product against a local unit vector e makes it non-symmetric
while remaining built from the projected functional derivatives. -/
def NonSymmetricTetherKernel
    (κ : ℝ)
    (ω_norm_sq : ℝ)
    (e : Fin 3 → ℝ)
    (proj_F proj_G : Fin 3 → ℝ) : ℝ :=
  -κ * ω_norm_sq * (dotProduct (crossProduct proj_F e) proj_G)

/-- The diagonal vanishes: `(F × e) · F = 0`. So this candidate is antisymmetric-type on the
diagonal and supplies no damping `B(F,F)`. -/
theorem nonSymmetricTetherKernel_diag (κ ω_norm_sq : ℝ) (e F : Fin 3 → ℝ) :
    NonSymmetricTetherKernel κ ω_norm_sq e F F = 0 := by
  unfold NonSymmetricTetherKernel
  rw [dotProduct_comm, dot_self_cross]
  simp

#print axioms nonSymmetricTetherKernel_diag

end NonSymmetricTether
