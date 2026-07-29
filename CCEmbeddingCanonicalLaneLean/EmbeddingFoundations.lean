import CCEmbeddingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure EmbeddingTargetPackage where
  targetManifold : Type u
  metric : Type v
  completenessCondition : Prop
  dimensionBound : Nat

structure EmbeddingSourcePackage where
  sourceManifold : Type w
  metric : Type x
  compactnessCondition : Prop
  convexityCondition : Prop

structure EmbeddingConditions (S : EmbeddingSourcePackage) (T : EmbeddingTargetPackage) where
  isometricEmbeddingExists : Prop
  minimalDistortion : ℝ
  spectralGapBound : Prop
  spectralGapBoundTerm : spectralGapBound

def EmbeddingConditionsClosed (S : EmbeddingSourcePackage) (T : EmbeddingTargetPackage) (C : EmbeddingConditions S T) : Prop :=
  C.isometricEmbeddingExists ∧ C.spectralGapBound

theorem embedding_conditions_closed_from_evidence (S : EmbeddingSourcePackage) (T : EmbeddingTargetPackage) (C : EmbeddingConditions S T) : EmbeddingConditionsClosed S T C := by
  exact And.intro C.isometricEmbeddingExists C.spectralGapBoundTerm

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse
