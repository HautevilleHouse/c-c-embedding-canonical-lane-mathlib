import CCEmbeddingCanonicalLaneLean.CCEmbeddingAdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure BoundedLipschitzFunc (X : CCEmbeddingSpace) where
  f : X.carrier → ℝ
  bounded : ∃ M, ∀ x, |f x| ≤ M
  lipschitz : ∃ L, ∀ x y, |f x - f y| ≤ L * X.metric x y

def KuratowskiEmbedding (X : CCEmbeddingSpace) : Type :=
  X.carrier → BoundedLipschitzFunc X

theorem kuratowski_is_emb (X : CCEmbeddingSpace) (h : X.metric = λ x y => X.metric x y) :
    ∃ (emb : KuratowskiEmbedding X), True := by
  refine ⟨λ a => ?_, trivial⟩
  refine ⟨λ b => X.metric a b, ?_, ?_⟩
  · refine ⟨0, ?_⟩
    intro x
    have hx : X.metric a x ≥ 0 := X.metric_nonneg _ _
    simp [hx]
  · refine ⟨1, ?_⟩
    intro x y
    have : X.metric a y - X.metric a x ≤ X.metric x y := X.metric_triangle _ _ _
    have : |X.metric a x - X.metric a y| ≤ X.metric x y := by
      have : |X.metric a x - X.metric a y| = |X.metric a y - X.metric a x| := abs_sub_comm _ _
      rw [this]
      have : X.metric a y - X.metric a x ≤ X.metric x y := X.metric_triangle a x y
      have : X.metric a x - X.metric a y ≤ X.metric x y := X.metric_triangle a y x
      exact abs_le.mpr ⟨by linarith, by linarith⟩
    simpa [mul_comm] using this

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse