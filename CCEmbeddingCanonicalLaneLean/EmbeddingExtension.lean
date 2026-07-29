import CCEmbeddingCanonicalLaneLean.EmbeddingTopology

/-!
# Embedding Extension Package
-/

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure EmbeddingExtensionPackage {X Y Z : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    (P : EmbeddingFunctionSpacePackage X Y)
    (Q : EmbeddingFunctionSpacePackage Y Z) where
  compositionEmbedding : EmbeddingFunctionSpacePackage X Z
  extensionProperty : Prop
  homotopyExtension : Prop
  uniqueExtension : Prop

structure EmbeddingExtensionEvidence {X Y Z : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {P : EmbeddingFunctionSpacePackage X Y}
    {Q : EmbeddingFunctionSpacePackage Y Z}
    (R : EmbeddingExtensionPackage P Q) where
  extensionPropertyClosed : R.extensionProperty
  homotopyExtensionClosed : R.homotopyExtension
  uniqueExtensionClosed : R.uniqueExtension

def EmbeddingExtensionClosed {X Y Z : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {P : EmbeddingFunctionSpacePackage X Y}
    {Q : EmbeddingFunctionSpacePackage Y Z}
    (R : EmbeddingExtensionPackage P Q) : Prop :=
  R.extensionProperty ∧ R.homotopyExtension ∧ R.uniqueExtension

theorem embedding_extension_closed_from_evidence
    {X Y Z : Type u} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {P : EmbeddingFunctionSpacePackage X Y}
    {Q : EmbeddingFunctionSpacePackage Y Z}
    (R : EmbeddingExtensionPackage P Q)
    (E : EmbeddingExtensionEvidence R) :
    EmbeddingExtensionClosed R := by
  exact And.intro E.extensionPropertyClosed
    (And.intro E.homotopyExtensionClosed E.uniqueExtensionClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse