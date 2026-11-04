# NS_Tether_Alternatives

Exploratory Lean formalizations and papers for alternative tether designs.

**Author:** Benjamin Stanley Frohman  
**Status:** Experimental. No claim that the Millennium Problem is solved.

## Tracks

1. **A-posteriori route**  
   Estimates moved outside the bracket and applied to solutions of the unmodified classical 3D incompressible Navier–Stokes equations. Geometric layer (symmetric TetherKernel, C2, route-2 canonicity) remains as motivation. Analytic bounds stay named open assumptions until discharged from upstream classical results.

2. **+κ (anti-damping) option**  
   Sign of the correction flipped to +κ. The quadratic form becomes positive-semidefinite. Under the same C2 + symmetry the contribution to ˙M remains identically zero. If the obstruction were removed the term would accelerate growth. Included for completeness of the algebraic picture.

## Clay / blow-up criteria

Any future result that produces a Beale–Kato–Majda-type criterion or a global bound is conditional on the remaining analytic hypotheses. No unconditional regularity theorem is asserted here.

## Authorship

All original mathematics by Benjamin Stanley Frohman. Lean encoding assistance disclosed only in commit messages or PR bodies when used; never as Co-authored-by.

## Workflow and audit discipline

Every change to `main` follows the same checks:

1. **Green build.** `lake build` finishes with no errors.
2. **Standard axioms only.** `#print axioms` on each certificate lists only `propext`, `Classical.choice` and `Quot.sound`. Any `sorryAx` or user `axiom` fails the audit and must be listed by name and location.
3. **Open assumptions are visible.** Each analytic input that is not yet proved appears as an explicit hypothesis in a theorem statement, never as a hidden `axiom` or a `sorry`.
4. **No `sorry` on the geometric layer.** The bracket, kernel and Gâteaux files build with zero `sorry` warnings.
5. **Paper matches the code.** After each green push, a Zenodo paper is published that lists exactly the machine-checked certificates and the open assumptions of that commit, and nothing more.

Licensing: code is Apache-2.0 (`LICENSE`); papers and notes are CC-BY-4.0 (`LICENSE-CC-BY-4.0`).
Copyright (c) 2026 Benjamin Stanley Frohman.

### Current audit (2026-11-04)

- `NonSymmetric/NonSymmetricTether.lean` compiles against Mathlib (checked with `lake env lean` from a Mathlib project). `nonSymmetricTetherKernel_diag` uses standard axioms only. There is no `sorry` and no `axiom`.
- This repo has no lakefile yet. `TrajectoryDistinction.lean` imports `NS_Millennium_Proof` and only builds inside that project.
- Open item inherited from NS_Millennium_Proof: δH = ψ, not u, in the vorticity pairing (see `paper/NS_Tether_Alternatives.pdf`).
