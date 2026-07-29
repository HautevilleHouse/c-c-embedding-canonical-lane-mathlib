import CCEmbeddingCanonicalLaneLean.CCEmbeddingBridgeLemmas

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

def gateClosed (A : CCEmbeddingAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : CCEmbeddingAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse
