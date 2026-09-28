import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

/-!
# Rank–nullity teoremi

`latex/notes/linear-algebra/main.tex` içindeki Teorem 1.2 ve Sonuç 1.3'ün
formal versiyonu.
-/

namespace MathLab.LinearAlgebra

variable {K V W : Type*} [Field K]
  [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
  [FiniteDimensional K V]

/-- **Rank–nullity**: `dim V = dim (ker T) + rank T`. -/
theorem rank_nullity (T : V →ₗ[K] W) :
    Module.finrank K V =
      Module.finrank K (LinearMap.ker T) + Module.finrank K (LinearMap.range T) := by
  rw [add_comm]
  exact (LinearMap.finrank_range_add_finrank_ker T).symm

/-- Boyutları eşit uzaylar arasında: birebir ⟺ örten. -/
theorem injective_iff_surjective_of_finrank_eq [FiniteDimensional K W]
    (T : V →ₗ[K] W) (h : Module.finrank K V = Module.finrank K W) :
    Function.Injective T ↔ Function.Surjective T := by
  have hrn := rank_nullity T
  rw [← LinearMap.ker_eq_bot, ← LinearMap.range_eq_top, ← Submodule.finrank_eq_zero]
  constructor
  · intro hker
    apply Submodule.eq_top_of_finrank_eq
    omega
  · intro hrange
    rw [hrange, finrank_top] at hrn
    omega

end MathLab.LinearAlgebra
