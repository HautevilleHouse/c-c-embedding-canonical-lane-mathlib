import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CCEmbeddingSpace where
  domain : Type
  domainTopology : TopologicalSpace domain
  codomain : Type
  codomainTopology : TopologicalSpace codomain
  embedding : domain → codomain
  continuous : Continuous embedding
  isEmbedding : Topology.IsEmbedding embedding

structure CCEmbeddingAdmittedObject where
  space : CCEmbeddingSpace
  compactDomain : CompactSpace space.domain
  hausdorffCodomain : T2Space space.codomain
  conclusion : Prop

structure CCEmbeddingEndgameState where
  object : CCEmbeddingAdmittedObject

def CCEmbeddingWitnessClosed (O : CCEmbeddingAdmittedObject) : Prop :=
  O.conclusion

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse