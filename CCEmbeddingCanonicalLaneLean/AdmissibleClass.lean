import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CCAdmissibleObject where
  carrierSpace : Type u
  topology : TopologicalSpace carrierSpace
  targetSpace : Type v
  targetTopology : TopologicalSpace targetSpace
  embedding : carrierSpace → targetSpace
  continuousEmbedding : Continuous embedding
  properEmbedding : Prop
  closedEmbedding : closedEmbedding
  conclusion : closedEmbedding

structure CCEndgameState where
  object : CCAdmissibleObject

def CCWitnessClosed (O : CCAdmissibleObject) : Prop :=
  O.closedEmbedding

structure AdmissibleClass where
  object : CCAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CCWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse