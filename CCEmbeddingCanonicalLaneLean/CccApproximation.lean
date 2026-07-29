import CCEmbeddingCanonicalLaneLean.CccAdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CccApproximation (A : CccAdmissibleClass) where
  sourceSpace : Type u
  targetSpace : Type v
  embeddingSequence : ℕ → (sourceSpace → targetSpace)
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  compactConvergence : Prop
  limitEmbedding : sourceSpace → targetSpace
  limitClosedEmbedding : Prop
  convergenceClosed : pointwiseConvergence ∧ uniformConvergence ∧ compactConvergence
  limitClosedEmbeddingTerm : limitClosedEmbedding

def CccApproximationClosed (A : CccAdmissibleClass) (C : CccApproximation A) : Prop :=
  C.convergenceClosed ∧ C.limitClosedEmbedding

theorem ccc_approximation_closed (A : CccAdmissibleClass) (C : CccApproximation A) :
    CccApproximationClosed A C := by
  exact And.intro C.convergenceClosed C.limitClosedEmbeddingTerm

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse