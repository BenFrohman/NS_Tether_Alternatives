/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
Minimal skeleton for the non-symmetric candidate.
Not yet imported into the main geometric layer.
-/

namespace NonSymmetric

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Placeholder for a local unit vector field (direction of ω). -/
def e : E := 0  -- to be replaced by a unit field

/-- Non-symmetric bilinear form (schematic). -/
noncomputable def T (v w : E) : ℝ :=
  -κ * ⟨v × e, w⟩  -- κ to be supplied; cross product schematic

/-- C2 in the first slot (to be proved once the form is fully defined). -/
axiom T_on_H (h : E) : T h _ = 0

end NonSymmetric
