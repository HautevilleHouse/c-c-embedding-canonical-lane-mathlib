import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCE embedding

structure HolderEmbeddingPackage where
  sourceSpace : Type u
  targetSpace : Type v
  holderExponent : ℝ
  embeddingInequality : Prop
  compactnessCondition : Prop

structure HolderEmbeddingEvidence (H : HolderEmbeddingPackage) where
  embeddingInequalityClosed : H.embeddingInequality
  compactnessConditionClosed : H.compactnessCondition

def HolderEmbeddingClosed (H : HolderEmbeddingPackage) : Prop :=
  H.embeddingInequality ∧ H.compactnessCondition

theorem holder_embedding_closed_from_evidence (H : HolderEmbeddingPackage)
    (E : HolderEmbeddingEvidence H) : HolderEmbeddingClosed H := by
  exact And.intro E.embeddingInequalityClosed E.compactnessConditionClosed

end CCE embedding
end HautevilleHouse
