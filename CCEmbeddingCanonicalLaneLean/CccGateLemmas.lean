import CCEmbeddingCanonicalLaneLean.CccBridgeLemmas

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

def gateClosed (A : CccAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : CccAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse