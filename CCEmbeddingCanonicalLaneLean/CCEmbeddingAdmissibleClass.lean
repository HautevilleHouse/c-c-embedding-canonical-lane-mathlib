import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CCEmbeddingSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  metric : carrier → carrier → ℝ
  metricPositive : ∀ x y, metric x y ≥ 0
  metricIdent : ∀ x y, metric x y = 0 ↔ x = y
  metricSymm : ∀ x y, metric x y = metric y x
  metricTriangle : ∀ x y z, metric x z ≤ metric x y + metric y z

structure CCEmbeddingAdmittedObject where
  src : CCEmbeddingSpace
  tgt : CCEmbeddingSpace
  embedFunc : src.carrier → tgt.carrier
  isIsometric : ∀ x y, src.metric x y = tgt.metric (embedFunc x) (embedFunc y)
  isClosed : Prop
  conclusion : isClosed

structure CCEmbeddingAdmissibleClass where
  object : CCEmbeddingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : CCEmbeddingAdmissibleClass) : Prop :=
  CCEmbeddingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse
