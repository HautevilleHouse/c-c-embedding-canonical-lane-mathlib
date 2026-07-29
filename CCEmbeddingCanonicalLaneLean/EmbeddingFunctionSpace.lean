import CCEmbeddingCanonicalLaneLean.AdmissibleClass

/-!
# Embedding Function Space Package
-/

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure EmbeddingFunctionSpacePackage {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] where
  continuousMaps : Set (X → Y)
  topology : TopologicalSpace continuousMaps
  embeddingSubset : Subset (SetOfEmbeddings X Y) continuousMaps
  closureUnderLimits : Prop
  closureUnderComposition : Prop

structure EmbeddingFunctionSpaceEvidence {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    (P : EmbeddingFunctionSpacePackage X Y) where
  embeddingSubsetClosed : P.embeddingSubset
  closureUnderLimitsClosed : P.closureUnderLimits
  closureUnderCompositionClosed : P.closureUnderComposition

def EmbeddingFunctionSpaceClosed {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    (P : EmbeddingFunctionSpacePackage X Y) : Prop :=
  P.embeddingSubset ∧ P.closureUnderLimits ∧ P.closureUnderComposition

theorem embedding_function_space_closed_from_evidence
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (P : EmbeddingFunctionSpacePackage X Y)
    (E : EmbeddingFunctionSpaceEvidence P) :
    EmbeddingFunctionSpaceClosed P := by
  exact And.intro E.embeddingSubsetClosed
    (And.intro E.closureUnderLimitsClosed E.closureUnderCompositionClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse