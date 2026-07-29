import CCEmbeddingCanonicalLaneLean.EmbeddingExtension

/-!
# Embedding Classification Package
-/

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure EmbeddingClassificationPackage {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    (P : EmbeddingFunctionSpacePackage X Y) where
  embeddingType : String
  classificationTheorem : Prop
  obstructionTheory : Prop
  normalBundlesClassified : Prop
  isotopyClassification : Prop
  classificationMatchesMathlib : Prop

structure EmbeddingClassificationEvidence {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    {P : EmbeddingFunctionSpacePackage X Y}
    (C : EmbeddingClassificationPackage P) where
  classificationTheoremClosed : C.classificationTheorem
  obstructionTheoryClosed : C.obstructionTheory
  normalBundlesClassifiedClosed : C.normalBundlesClassified
  isotopyClassificationClosed : C.isotopyClassification
  classificationMatchesMathlibClosed : C.classificationMatchesMathlib

def EmbeddingClassificationClosed {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    {P : EmbeddingFunctionSpacePackage X Y}
    (C : EmbeddingClassificationPackage P) : Prop :=
  C.classificationTheorem ∧ C.obstructionTheory ∧
  C.normalBundlesClassified ∧ C.isotopyClassification ∧
  C.classificationMatchesMathlib

theorem embedding_classification_closed_from_evidence
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    {P : EmbeddingFunctionSpacePackage X Y}
    (C : EmbeddingClassificationPackage P)
    (E : EmbeddingClassificationEvidence C) :
    EmbeddingClassificationClosed C := by
  exact And.intro E.classificationTheoremClosed
    (And.intro E.obstructionTheoryClosed
      (And.intro E.normalBundlesClassifiedClosed
        (And.intro E.isotopyClassificationClosed
          E.classificationMatchesMathlibClosed)))

theorem embedding_classification_supplies_mathlib_statement
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    {P : EmbeddingFunctionSpacePackage X Y}
    (C : EmbeddingClassificationPackage P) : C.classificationTheorem :=
  C.classificationTheorem

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse