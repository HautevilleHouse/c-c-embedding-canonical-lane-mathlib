import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

/-!
# Calderón–Zygmund Embedding Package
-/

structure CalderonZygmundEmbeddingPackage where
  functionSpace : Type u
  measureSpace : Type v
  embeddingOperator : (measureSpace → ℝ) → (measureSpace → ℝ)
  boundednessOnL2 : Prop
  weakTypeEstimate : Prop
  interpolationEndpoint : Prop

structure CalderonZygmundEmbeddingEvidence (C : CalderonZygmundEmbeddingPackage) where
  boundednessOnL2Closed : C.boundednessOnL2
  weakTypeEstimateClosed : C.weakTypeEstimate
  interpolationEndpointClosed : C.interpolationEndpoint

def CalderonZygmundEmbeddingClosed (C : CalderonZygmundEmbeddingPackage) : Prop :=
  C.boundednessOnL2 ∧ C.weakTypeEstimate ∧ C.interpolationEndpoint

theorem calderon_zygmund_embedding_closed_from_evidence
    (C : CalderonZygmundEmbeddingPackage) (E : CalderonZygmundEmbeddingEvidence C) :
    CalderonZygmundEmbeddingClosed C := by
  exact And.intro E.boundednessOnL2Closed
    (And.intro E.weakTypeEstimateClosed E.interpolationEndpointClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse