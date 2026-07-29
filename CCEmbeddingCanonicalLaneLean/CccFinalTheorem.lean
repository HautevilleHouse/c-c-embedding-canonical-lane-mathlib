import CCEmbeddingCanonicalLaneLean.CccGateLemmas

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

def ConstrainedCccClosure (A : CccAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ccc_endgame (A : CccAdmissibleClass) :
    ConstrainedCccClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse