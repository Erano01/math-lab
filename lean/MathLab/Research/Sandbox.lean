import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic.Ring

/-!
# Araştırma sandbox'ı

Yeni fikirler için başlangıç dosyası. Olgunlaşan sonuçları ayrı modüllere taşıyın.
-/

namespace MathLab.Research

open Finset

/-- İlk `n` tek sayının toplamı `n²`'dir. -/
theorem sum_odd (n : ℕ) : ∑ i ∈ range n, (2 * i + 1) = n ^ 2 := by
  induction n with
  | zero => simp
  | succ n ih => rw [sum_range_succ, ih]; ring

end MathLab.Research
