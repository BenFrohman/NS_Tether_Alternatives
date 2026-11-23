/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import NonSymmetric.NonSymmetricTether
import Mathlib.LinearAlgebra.Matrix.DotProduct

/-!
# non_symmetric.NonSymmetricTether

C2 in the first slot for the non-symmetric candidate kernel
`N(F,G) = -κ ‖ω‖² (Π_u F × e) · Π_u G` of `NonSymmetric/NonSymmetricTether.lean`.

Here `Π_u v = v - (⟨v,u⟩/⟨u,u⟩) u` is the projection of `v ∈ ℝ³` orthogonal to `u`
(with `Π_0 v = v`). The kinetic energy `H = ½∫|u|²` has functional derivative `δH = u`,
so its projected derivative is `Π_u u = 0` (`Pi_u_self`), and the kernel vanishes whenever its
first slot is the projected kinetic-energy derivative (`T_on_H`).

`T_on_H` used to be stated here as an `axiom` in a file that did not elaborate. It is now a
theorem. It is a consequence of `Π_u u = 0` alone, so it holds for every kernel whose first slot
is pre-projected by `Π_u`; it does not single out this candidate and gives no damping or
regularity bound.
-/

open Matrix NonSymmetricTether

namespace NonSymmetricC2

/-- Projection of `v` orthogonal to `u`: `Π_u v = v - (⟨v,u⟩/⟨u,u⟩) u` (and `Π_0 v = v`). -/
noncomputable def Pi_u (u v : Fin 3 → ℝ) : Fin 3 → ℝ :=
  v - ((v ⬝ᵥ u) / (u ⬝ᵥ u)) • u

/-- `Π_u u = 0`. -/
theorem Pi_u_self (u : Fin 3 → ℝ) : Pi_u u u = 0 := by
  by_cases h : u ⬝ᵥ u = 0
  · have hu : u = 0 := dotProduct_self_eq_zero.mp h
    subst hu; simp [Pi_u]
  · simp [Pi_u, div_self h]

/-- **C2 in the first slot.** With `δH = u`, the kernel vanishes on `(Π_u δH, w)` for every `w`. -/
theorem T_on_H (κ ω_norm_sq : ℝ) (e u w : Fin 3 → ℝ) :
    NonSymmetricTetherKernel κ ω_norm_sq e (Pi_u u u) w = 0 := by
  simp [NonSymmetricTetherKernel, Pi_u_self]

end NonSymmetricC2

#print axioms NonSymmetricC2.Pi_u_self
#print axioms NonSymmetricC2.T_on_H
