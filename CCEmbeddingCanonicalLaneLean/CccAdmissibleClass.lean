import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CccAdmittedObject where
  sourceSpace : Type u
  targetSpace : Type v
  embedding : sourceSpace → targetSpace
  continuityCondition : Prop
  closedCondition : Prop
  boundedCondition : Prop
  completenessCondition : Prop
  conclusion : completenessCondition

structure CccAdmissibleClass where
  object : CccAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : CccAdmissibleClass) : Prop :=
  CccWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse