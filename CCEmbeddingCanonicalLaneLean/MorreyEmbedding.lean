import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCE embedding

structure MorreyEmbeddingPackage where
  functionSpace : Type u
  norm : functionSpace → ℝ
  dimension : ℕ
  exponent : ℝ
  embeddingToHolder : Prop
  continuityEstimate : Prop

structure MorreyEmbeddingEvidence (M : MorreyEmbeddingPackage) where
  embeddingToHolderClosed : M.embeddingToHolder
  continuityEstimateClosed : M.continuityEstimate

def MorreyEmbeddingClosed (M : MorreyEmbeddingPackage) : Prop :=
  M.embeddingToHolder ∧ M.continuityEstimate

theorem morrey_embedding_closed_from_evidence (M : MorreyEmbeddingPackage)
    (E : MorreyEmbeddingEvidence M) : MorreyEmbeddingClosed M := by
  exact And.intro E.embeddingToHolderClosed E.continuityEstimateClosed

end CCE embedding
end HautevilleHouse
