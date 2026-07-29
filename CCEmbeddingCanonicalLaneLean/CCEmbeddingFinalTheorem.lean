import CCEmbeddingCanonicalLaneLean.CCEmbeddingGateLemmas

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

def ConstrainedCCEmbeddingClosure (A : CCEmbeddingAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cc_embedding_endgame (A : CCEmbeddingAdmissibleClass) :
    ConstrainedCCEmbeddingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse
