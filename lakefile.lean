/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Lake

/-!
# lakefile

Machine-checked Lean 4 module.
-/

open Lake DSL

package NS_Tether_Alternatives where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩
  ]

-- Same pin as BenFrohman/NS_Millennium_Proof: Lean 4.30.0-rc1 + Mathlib v4.30.0-rc1.
require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "v4.30.0-rc1"

-- `TrajectoryDistinction.lean` imports `NS_Millennium_Proof.Modules.ArnoldGeometric`,
-- pinned here to NS_Millennium_Proof main at aa04c4feec0813c16778a016dc793dc9c542e6bd.
require NS_Millennium_Proof from git
  "https://github.com/BenFrohman/NS_Millennium_Proof.git" @ "aa04c4feec0813c16778a016dc793dc9c542e6bd"

-- Built modules: every tracked .lean file is in a default target or is run by CI.
@[default_target]
lean_lib NonSymmetric where
  roots := #[`NonSymmetric.NonSymmetricTether]

@[default_target]
lean_lib TrajectoryDistinction where
  roots := #[`TrajectoryDistinction]

@[default_target]
lean_lib NonSymmetricC2 where
  roots := #[`non_symmetric.NonSymmetricTether]
