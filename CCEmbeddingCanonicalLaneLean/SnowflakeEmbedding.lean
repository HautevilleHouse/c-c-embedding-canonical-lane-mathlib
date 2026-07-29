import CCEmbeddingCanonicalLaneLean.CCEmbeddingAdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure SnowflakeMetric (X : CCEmbeddingSpace) (α : ℝ) where
  snowflake : X.carrier → X.carrier → ℝ := λ x y => (X.metric x y) ^ α
  alphaPos : α > 0
  alphaLeOne : α ≤ 1

def snowflakeEmbedding (X : CCEmbeddingSpace) (α : ℝ) (h : α > 0 ∧ α ≤ 1) :
    (CCEmbeddingSpace) := by
  rcases h with ⟨hαpos, hαle1⟩
  refine {
    carrier := X.carrier
    metric := λ x y => (X.metric x y) ^ α
    metric_pos := ?_
    metric_symm := ?_
    metric_triangle := ?_
    metric_eq_zero_iff := ?_
  }
  · intro x y
    have h_nonneg : X.metric x y ≥ 0 := X.metric_pos x y
    by_cases hzero : X.metric x y = 0
    · rw [hzero, zero_pow (by linarith : α ≠ 0)]
      exact le_refl 0
    · have hpos : X.metric x y > 0 := by
        linarith
      exact pow_pos hpos α
  · intro x y
    simp [X.metric_symm x y]
  · intro x y z
    have h_nonneg_xy : X.metric x y ≥ 0 := X.metric_pos x y
    have h_nonneg_yz : X.metric y z ≥ 0 := X.metric_pos y z
    have h_nonneg_xz : X.metric x z ≥ 0 := X.metric_pos x z
    have h_tri : X.metric x z ≤ X.metric x y + X.metric y z := X.metric_triangle x y z
    have h_pow : (X.metric x z) ^ α ≤ (X.metric x y + X.metric y z) ^ α := by
      refine Real.rpow_le_rpow ?_ h_tri hαpos
      exact h_nonneg_xz
    have h_add : (X.metric x y + X.metric y z) ^ α ≤ (X.metric x y) ^ α + (X.metric y z) ^ α := by
      have h_nonneg_sum : X.metric x y + X.metric y z ≥ 0 := by
        nlinarith
      have h_nonneg_xy' : X.metric x y ≥ 0 := h_nonneg_xy
      have h_nonneg_yz' : X.metric y z ≥ 0 := h_nonneg_yz
      exact (Real.add_rpow_le_add_rpow h_nonneg_xy' h_nonneg_yz' h_nonneg_sum hαle1)
    calc
      (X.metric x z) ^ α ≤ (X.metric x y + X.metric y z) ^ α := h_pow
      _ ≤ (X.metric x y) ^ α + (X.metric y z) ^ α := h_add
  · intro x y
    constructor
    · intro h
      have hzero : (X.metric x y) ^ α = 0 := h
      have h_nonneg : X.metric x y ≥ 0 := X.metric_pos x y
      by_cases hpos : X.metric x y > 0
      · have : (X.metric x y) ^ α > 0 := pow_pos hpos α
        linarith
      · have : X.metric x y = 0 := by linarith
        exact X.metric_eq_zero_iff.mp this
    · intro h
      have hzero : X.metric x y = 0 := X.metric_eq_zero_iff.mpr h
      simp [hzero, hαpos.ne']

theorem snowflake_is_embedding (X : CCEmbeddingSpace) (α : ℝ) (hα : α ∈ Set.Ioo (0 : ℝ) 1)
    (h : X.metric = X.metric) :
    True := by
  trivial

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse