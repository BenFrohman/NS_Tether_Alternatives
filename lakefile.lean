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

-- Built modules. `non_symmetric/NonSymmetricTether.lean` is deliberately NOT built:
-- it is a placeholder skeleton that states its C2 property as an `axiom` (`T_on_H`)
-- and does not elaborate (`κ` is unbound). It stays in the tree as a draft.
@[default_target]
lean_lib NonSymmetric where
  roots := #[`NonSymmetric.NonSymmetricTether]

@[default_target]
lean_lib TrajectoryDistinction where
  roots := #[`TrajectoryDistinction]
